defmodule KenshuseiWeb.Router do
  use KenshuseiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KenshuseiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about    
    get "/schedule", PageController, :schedule
    get "/karate", PageController, :karate
    get "/kempo", PageController, :kempo
    get "/jujitsu", PageController, :jujitsu
    get "/taichi", PageController, :taichi
    get "/advanced", PageController, :advanced
    resources "/form_submissions", FormSubmissionController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", KenshuseiWeb do
  #   pipe_through :api
  # end
end
