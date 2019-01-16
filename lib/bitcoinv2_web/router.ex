defmodule Bitcoinv2Web.Router do
  use Bitcoinv2Web, :router

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

  scope "/", Bitcoinv2Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/dashboard/:num", SampleController, :startp
    # get "/dashboard", SampleController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bitcoinv2Web do
  #   pipe_through :api
  # end
end