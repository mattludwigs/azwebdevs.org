defmodule Org.Plugs.Admin do
  import Logger
  import Plug.Conn
  import Phoenix.Controller

  alias Org.Repo
  alias Org.User

  def init(default), do: default

  def call(conn, _) do
    current_user = get_session(conn, :current_user)

    case Repo.get(User, current_user) |> Map.get(:role) do
      "admin" ->
        debug("User is an admin")
        assign(conn, :current_user, current_user)
      _ ->
        debug("User is NOT an admin, redirecting")
        conn
            |> put_flash(:error, "You do not have the proper authorization to do that")
            |> redirect(to: "/")
            |> halt
    end
  end

  def call(conn) do
    current_user = get_session(conn, :current_user)
    debug(current_user)

    # case Map.get(current_user, :role) do
    # end
  end
end
