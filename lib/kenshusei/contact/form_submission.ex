defmodule Kenshusei.Contact.FormSubmission do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kenshusei.Contact.FormSubmission


  schema "form_submissions" do
    field :comment, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%FormSubmission{} = form_submission, attrs) do
    form_submission
    |> cast(attrs, [:name, :email, :comment])
    |> validate_required([:name, :email, :comment])
  end
end
