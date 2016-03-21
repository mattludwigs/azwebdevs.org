defmodule Org.Plugs.AssignCurrentUser do
  import Plug.Conn

  alias Org.Repo
  alias Org.User

  def init(default), do: default

  def call(conn, _) do
    current_user = get_session(conn, :current_user)

    if current_user do
      assign(conn, :current_user, Repo.get(User, current_user))
    else
      assign(conn, :current_user, nil)
    end
  end
end
