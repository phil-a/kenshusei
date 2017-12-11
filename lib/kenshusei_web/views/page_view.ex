defmodule KenshuseiWeb.PageView do
  use KenshuseiWeb, :view

  def verify_admin(nil), do: false
  def verify_admin(current_user) do
    is_admin?(current_user.role_id)
  end

  defp is_admin?(1), do: true
  defp is_admin?(_), do: false
end
