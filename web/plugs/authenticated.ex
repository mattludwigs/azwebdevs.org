defmodule Org.Plugs.Authenticated do
  import Plug.Conn
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, _) do
    current_user = get_session(conn, :current_user)

    if current_user do
      assign(conn, :current_user, current_user)
    else
      conn
        |> put_flash(:error, "Please sign in")
        |> redirect(to: "/")
        |> halt
    end
  end
end
