defmodule Org.PageController do
  use Org.Web, :controller

  def home(conn, _params) do
    render conn, "home.html"
  end

  def signin(conn, _params) do
    render conn, "signin.html"
  end

  def apply(conn, _params) do
    render conn, "apply.html"
  end

  def thanks(conn, _params) do
    render conn, "thanks.html"
  end
end
