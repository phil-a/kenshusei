defmodule KenshuseiWeb.LayoutView do
  use KenshuseiWeb, :view

  def render_title([]), do: "Zen Warrior"
  def render_title(["about"]), do: "Zen Warrior - About Us"
  def render_title(["schedule"]), do: "Zen Warrior - Our Schedule"
  def render_title(["karate"]), do: "Zen Warrior - Junior Karate"
  def render_title(["kempo"]), do: "Zen Warrior - Adult Shaolin Kempo"
  def render_title(["jujitsu"]), do: "Zen Warrior - Aiki Jujitsu"
  def render_title(["taichi"]), do: "Zen Warrior - Tai Chi Chuan"
  def render_title(["advanced"]), do: "Zen Warrior - Advanced Training"
  def render_title([_]), do: "Zen Warrior Martial Arts"
end
