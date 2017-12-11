defmodule Kenshusei.Coherence.User do
  @moduledoc false
  use Ecto.Schema
  use Coherence.Schema
  alias Kenshusei.Authorization.Role

  schema "users" do
    field :name, :string
    field :email, :string
    coherence_schema()
    belongs_to :role, Role

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :role_id] ++ coherence_fields())
    |> default_role_if_none(params)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end

  def changeset(model, params, :password) do
    model
    |> cast(params, ~w(password password_confirmation reset_password_token reset_password_sent_at))
    |> validate_coherence_password_reset(params)
  end

  def default_role_if_none(model, params) do
    default_role(model, is_registration(params))
  end

  defp default_role(model, true), do: put_change(model, :role_id, get_change(model, :role_id, 2))
  defp default_role(model, false), do: model

  defp is_registration(params) do
    ["email", "name", "password", "password_confirmation"]
    |> Enum.all?(&(Map.has_key?(params, &1)))
  end
  
end
