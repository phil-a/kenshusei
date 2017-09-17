defmodule KenshuseiWeb.PageController do
  use KenshuseiWeb, :controller

  alias Kenshusei.Contact
  alias Kenshusei.Contact.FormSubmission

  def index(conn, _params) do
    form_submission_changeset = Contact.change_form_submission(%FormSubmission{})
    render conn, "index.html", form_submission_changeset: form_submission_changeset
  end
end
