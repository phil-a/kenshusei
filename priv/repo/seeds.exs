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

# Create Roles
admin_role = %Kenshusei.Authorization.Role{}
|> Kenshusei.Authorization.Role.changeset(%{"name" => "Admin Role", "admin" => true}) 
|> Kenshusei.Repo.insert!

basic_role = %Kenshusei.Authorization.Role{}
|> Kenshusei.Authorization.Role.changeset(%{"name" => "Basic Role", "admin" => false})
|> Kenshusei.Repo.insert!

# Create Users
Kenshusei.Coherence.User.changeset(%Kenshusei.Coherence.User{}, %{"name" => "Admin", "email" => "admin@example.com", "password" => "secret", "password_confirmation" => "secret", "role_id" => admin_role.id})
|> Kenshusei.Repo.insert!

Kenshusei.Coherence.User.changeset(%Kenshusei.Coherence.User{}, %{"name" => "Basic", "email" => "basic@example.com", "password" => "secret", "password_confirmation" => "secret", "role_id" => basic_role.id })
|> Kenshusei.Repo.insert!

Kenshusei.Coherence.User.changeset(%Kenshusei.Coherence.User{}, %{"name" => "NoRole", "email" => "norole@example.com", "password" => "secret", "password_confirmation" => "secret" })
|> Kenshusei.Repo.insert!