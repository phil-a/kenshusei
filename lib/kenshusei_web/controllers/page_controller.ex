defmodule KenshuseiWeb.PageController do
  use KenshuseiWeb, :controller

  alias Kenshusei.Contact
  alias Kenshusei.Contact.FormSubmission

  def index(conn, _params) do
    form_submission_changeset = Contact.change_form_submission(%FormSubmission{})
    render conn, "index.html", form_submission_changeset: form_submission_changeset
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def karate(conn, _params) do
    render conn, "karate.html"
  end

  def kempo(conn, _params) do
    render conn, "kempo.html"
  end

  def jujitsu(conn, _params) do
    render conn, "jujitsu.html"
  end

  def taichi(conn, _params) do
    render conn, "taichi.html"
  end

  def advanced(conn, _params) do
    render conn, "advanced.html"
  end

  def schedule(conn, _params) do
    render conn, "schedule.html"
  end
end
