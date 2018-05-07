defmodule Phoenixvideogallery.Router do
  use Phoenixvideogallery.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenixvideogallery.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Phoenixvideogallery do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", Phoenixvideogallery do
    pipe_through :browser

    get "/signout", AuthController, :delete
    get "/:provider", AuthController, :request
    get "/:proider/callback", AuthController, :new
  end

  # Other scopes may use custom stacks.
  # scope "/api", Phoenixvideogallery do
  #   pipe_through :api
  # end
end
