defmodule KenshuseiWeb.FormSubmissionControllerTest do
  use KenshuseiWeb.ConnCase

  alias Kenshusei.Contact

  @create_attrs %{comment: "some comment", email: "some email", name: "some name"}
  @update_attrs %{comment: "some updated comment", email: "some updated email", name: "some updated name"}
  @invalid_attrs %{comment: nil, email: nil, name: nil}

  def fixture(:form_submission) do
    {:ok, form_submission} = Contact.create_form_submission(@create_attrs)
    form_submission
  end

  describe "index" do
    test "lists all form_submissions", %{conn: conn} do
      conn = get conn, form_submission_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Form submissions"
    end
  end

  describe "new form_submission" do
    test "renders form", %{conn: conn} do
      conn = get conn, form_submission_path(conn, :new)
      assert html_response(conn, 200) =~ "New Form submission"
    end
  end

  describe "create form_submission" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, form_submission_path(conn, :create), form_submission: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == form_submission_path(conn, :show, id)

      conn = get conn, form_submission_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Form submission"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, form_submission_path(conn, :create), form_submission: @invalid_attrs
      assert html_response(conn, 200) =~ "New Form submission"
    end
  end

  describe "edit form_submission" do
    setup [:create_form_submission]

    test "renders form for editing chosen form_submission", %{conn: conn, form_submission: form_submission} do
      conn = get conn, form_submission_path(conn, :edit, form_submission)
      assert html_response(conn, 200) =~ "Edit Form submission"
    end
  end

  describe "update form_submission" do
    setup [:create_form_submission]

    test "redirects when data is valid", %{conn: conn, form_submission: form_submission} do
      conn = put conn, form_submission_path(conn, :update, form_submission), form_submission: @update_attrs
      assert redirected_to(conn) == form_submission_path(conn, :show, form_submission)

      conn = get conn, form_submission_path(conn, :show, form_submission)
      assert html_response(conn, 200) =~ "some updated comment"
    end

    test "renders errors when data is invalid", %{conn: conn, form_submission: form_submission} do
      conn = put conn, form_submission_path(conn, :update, form_submission), form_submission: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Form submission"
    end
  end

  describe "delete form_submission" do
    setup [:create_form_submission]

    test "deletes chosen form_submission", %{conn: conn, form_submission: form_submission} do
      conn = delete conn, form_submission_path(conn, :delete, form_submission)
      assert redirected_to(conn) == form_submission_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, form_submission_path(conn, :show, form_submission)
      end
    end
  end

  defp create_form_submission(_) do
    form_submission = fixture(:form_submission)
    {:ok, form_submission: form_submission}
  end
end
