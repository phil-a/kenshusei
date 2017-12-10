# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kenshusei.Repo.insert!(%Kenshusei.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Kenshusei.Repo.delete_all Kenshusei.Coherence.User

role = %Kenshusei.Authorization.Role{}
|> Kenshusei.Authorization.Role.changeset(%{name: "Admin Role", admin: true})
|> Kenshusei.Repo.insert!

Kenshusei.Coherence.User.changeset(%Kenshusei.Coherence.User{}, %{name: "Admin", email: "admin@example.com", password: "secret", password_confirmation: "secret", role_id: role.id})
|> Kenshusei.Repo.insert!