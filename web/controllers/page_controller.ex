defmodule OrgApi.PageController do
  use OrgApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
