defmodule Org.Plugs.Authorized do
  @behaviour Plug

  import Logger
  import Plug.Conn
  import Phoenix.Controller

  def init(default), do: default

  def call(%{assigns: %{current_user: current_user}} = conn, roles) do
    if Enum.member?(roles, current_user.role) do
      debug("User #{current_user.id} is authorized as a #{current_user.role}")
      conn
    else
      debug("User #{current_user.id} is NOT authorized as one of #{roles}, redirecting")
      conn
        |> flash_and_redirect
    end
  end

  def call(conn, _) do
    debug("Unable to find current user")
    conn
      |> flash_and_redirect
  end

  defp flash_and_redirect(conn) do
    conn
      |> put_flash(:error, "You do not have the proper authorization to do that")
      |> redirect(to: "/")
      |> halt
  end
end
