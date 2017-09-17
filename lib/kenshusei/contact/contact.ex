defmodule Kenshusei.Contact do
  @moduledoc """
  The Contact context.
  """

  import Ecto.Query, warn: false
  alias Kenshusei.Repo

  alias Kenshusei.Contact.FormSubmission

  @doc """
  Returns the list of form_submissions.

  ## Examples

      iex> list_form_submissions()
      [%FormSubmission{}, ...]

  """
  def list_form_submissions do
    Repo.all(FormSubmission)
  end

  @doc """
  Gets a single form_submission.

  Raises `Ecto.NoResultsError` if the Form submission does not exist.

  ## Examples

      iex> get_form_submission!(123)
      %FormSubmission{}

      iex> get_form_submission!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form_submission!(id), do: Repo.get!(FormSubmission, id)

  @doc """
  Creates a form_submission.

  ## Examples

      iex> create_form_submission(%{field: value})
      {:ok, %FormSubmission{}}

      iex> create_form_submission(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form_submission(attrs \\ %{}) do
    %FormSubmission{}
    |> FormSubmission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form_submission.

  ## Examples

      iex> update_form_submission(form_submission, %{field: new_value})
      {:ok, %FormSubmission{}}

      iex> update_form_submission(form_submission, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form_submission(%FormSubmission{} = form_submission, attrs) do
    form_submission
    |> FormSubmission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FormSubmission.

  ## Examples

      iex> delete_form_submission(form_submission)
      {:ok, %FormSubmission{}}

      iex> delete_form_submission(form_submission)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form_submission(%FormSubmission{} = form_submission) do
    Repo.delete(form_submission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_submission changes.

  ## Examples

      iex> change_form_submission(form_submission)
      %Ecto.Changeset{source: %FormSubmission{}}

  """
  def change_form_submission(%FormSubmission{} = form_submission) do
    FormSubmission.changeset(form_submission, %{})
  end
end
