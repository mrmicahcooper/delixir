defmodule DelixirWeb.Router do
  use DelixirWeb, :router
  import Phoenix.LiveDashboard.Router

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

  scope "/", DelixirWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :browser
    live_dashboard "/dashboard", metrics: DelixirWeb.Telemetry
  end
end
