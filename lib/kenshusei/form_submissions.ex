defmodule Kenshusei.FormSubmissions do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kenshusei.FormSubmissions


  schema "form_submissions" do
    field :comment, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%FormSubmissions{} = form_submissions, attrs) do
    form_submissions
    |> cast(attrs, [:name, :email, :comment])
    |> validate_required([:name, :email, :comment])
  end
end
