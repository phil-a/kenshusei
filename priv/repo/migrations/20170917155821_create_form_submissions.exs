defmodule Kenshusei.Repo.Migrations.CreateFormSubmissions do
  use Ecto.Migration

  def change do
    create table(:form_submissions) do
      add :name, :string
      add :email, :string
      add :comment, :string

      timestamps()
    end

  end
end
