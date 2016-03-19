defmodule OrgApi.Router do
  use OrgApi.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/", OrgApi do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
