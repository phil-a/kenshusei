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

Kenshusei.Coherence.User.changeset(%Kenshusei.Coherence.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> Kenshusei.Repo.insert!