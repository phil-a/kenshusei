defmodule KenshuseiWeb.LayoutView do
  use KenshuseiWeb, :view
  
  def render_title([]), do: "Kenshusei Martial Arts"
  def render_title(["about"]), do: "Kenshusei - About Us"
  def render_title(["schedule"]), do: "Kenshusei - Our Schedule"
  def render_title(["karate"]), do: "Kenshusei - Junior Karate"
  def render_title(["kempo"]), do: "Kenshusei - Adult Shaolin Kempo"
  def render_title(["jujitsu"]), do: "Kenshusei - Aiki Jujitsu"
  def render_title(["taichi"]), do: "Kenshusei - Tai Chi Chuan"
  def render_title(["advanced"]), do: "Kenshusei - Advanced Training"
  def render_title([_]), do: "Kenshusei Martial Arts"

end
