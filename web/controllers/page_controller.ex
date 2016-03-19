defmodule Org.PageController do
  use Org.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
