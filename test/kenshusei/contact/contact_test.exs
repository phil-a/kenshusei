defmodule Kenshusei.ContactTest do
  use Kenshusei.DataCase

  alias Kenshusei.Contact

  describe "form_submissions" do
    alias Kenshusei.Contact.FormSubmission

    @valid_attrs %{comment: "some comment", email: "some email", name: "some name"}
    @update_attrs %{comment: "some updated comment", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{comment: nil, email: nil, name: nil}

    def form_submission_fixture(attrs \\ %{}) do
      {:ok, form_submission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contact.create_form_submission()

      form_submission
    end

    test "list_form_submissions/0 returns all form_submissions" do
      form_submission = form_submission_fixture()
      assert Contact.list_form_submissions() == [form_submission]
    end

    test "get_form_submission!/1 returns the form_submission with given id" do
      form_submission = form_submission_fixture()
      assert Contact.get_form_submission!(form_submission.id) == form_submission
    end

    test "create_form_submission/1 with valid data creates a form_submission" do
      assert {:ok, %FormSubmission{} = form_submission} = Contact.create_form_submission(@valid_attrs)
      assert form_submission.comment == "some comment"
      assert form_submission.email == "some email"
      assert form_submission.name == "some name"
    end

    test "create_form_submission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contact.create_form_submission(@invalid_attrs)
    end

    test "update_form_submission/2 with valid data updates the form_submission" do
      form_submission = form_submission_fixture()
      assert {:ok, form_submission} = Contact.update_form_submission(form_submission, @update_attrs)
      assert %FormSubmission{} = form_submission
      assert form_submission.comment == "some updated comment"
      assert form_submission.email == "some updated email"
      assert form_submission.name == "some updated name"
    end

    test "update_form_submission/2 with invalid data returns error changeset" do
      form_submission = form_submission_fixture()
      assert {:error, %Ecto.Changeset{}} = Contact.update_form_submission(form_submission, @invalid_attrs)
      assert form_submission == Contact.get_form_submission!(form_submission.id)
    end

    test "delete_form_submission/1 deletes the form_submission" do
      form_submission = form_submission_fixture()
      assert {:ok, %FormSubmission{}} = Contact.delete_form_submission(form_submission)
      assert_raise Ecto.NoResultsError, fn -> Contact.get_form_submission!(form_submission.id) end
    end

    test "change_form_submission/1 returns a form_submission changeset" do
      form_submission = form_submission_fixture()
      assert %Ecto.Changeset{} = Contact.change_form_submission(form_submission)
    end
  end
end
