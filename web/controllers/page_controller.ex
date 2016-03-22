defmodule Org.PageController do
  use Org.Web, :controller

  alias Org.Group

  def home(conn, _params) do
    groups = Repo.all(from g in Group, preload: [:user])
    render(conn, "home.html", groups: groups)
  end

  def signin(conn, _params) do
    render(conn, "signin.html")
  end

  def apply(conn, _params) do
    render(conn, "apply.html")
  end

  def thanks(conn, _params) do
    render(conn, "thanks.html")
  end
end
