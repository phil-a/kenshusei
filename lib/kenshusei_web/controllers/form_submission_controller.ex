defmodule KenshuseiWeb.FormSubmissionController do
  use KenshuseiWeb, :controller

  alias Kenshusei.{ Contact,
                    Contact.FormSubmission,
                    Mailer,
                    Email 
                  }

  def create(conn, %{"form_submission" => form_submission_params} = params) do
    case Recaptcha.verify(params["g-recaptcha-response"]) do
      {:ok, response} -> 
        case Contact.create_form_submission(form_submission_params) do
          {:ok, form_submission} ->
            Email.contact_email(form_submission) |> Mailer.deliver_now
            Email.owner_email(form_submission) |> Mailer.deliver_now
            IO.puts("Form submission created successfully.")
            conn
            |> put_flash(:info, "Form submission created successfully.")
            |> redirect(to: page_path(conn, :index))
          {:error, %Ecto.Changeset{} = changeset} ->
            IO.puts("Error submitting form.")
            conn
            |> put_flash(:info, "Form submission created successfully.")
            |> redirect(to: page_path(conn, :index))
        end
      {:error, errors} ->
        IO.puts("Captcha not verified. Please try again.")
        conn
        |> put_flash(:info, "Captcha not verified. Please try again.")
        |> redirect(to: page_path(conn, :index))
    end
  end

  def show(conn, %{"id" => id}) do
    form_submission = Contact.get_form_submission!(id)
    render(conn, "show.html", form_submission: form_submission)
  end

  def edit(conn, %{"id" => id}) do
    form_submission = Contact.get_form_submission!(id)
    changeset = Contact.change_form_submission(form_submission)
    render(conn, "edit.html", form_submission: form_submission, changeset: changeset)
  end

  def update(conn, %{"id" => id, "form_submission" => form_submission_params}) do
    form_submission = Contact.get_form_submission!(id)

    case Contact.update_form_submission(form_submission, form_submission_params) do
      {:ok, form_submission} ->
        conn
        |> put_flash(:info, "Form submission updated successfully.")
        |> redirect(to: form_submission_path(conn, :show, form_submission))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", form_submission: form_submission, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    form_submission = Contact.get_form_submission!(id)
    {:ok, _form_submission} = Contact.delete_form_submission(form_submission)

    conn
    |> put_flash(:info, "Form submission deleted successfully.")
    |> redirect(to: form_submission_path(conn, :index))
  end
end
