defmodule Org.Router do
  use Org.Web, :router

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

  scope "/", Org.Admin do
    pipe_through :browser

    resources "/users", UserController, except: [:index, :show]
    resources "/groups", GroupController, except: [:index, :show]
  end

  scope "/", Org do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show]
    resources "/groups", GroupController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Org do
  #   pipe_through :api
  # end
end
