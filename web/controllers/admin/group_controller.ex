defmodule Org.Admin.GroupController do
  use Org.Web, :controller

  alias Org.Group

  plug :scrub_params, "group" when action in [:create, :update]

  def index(conn, _params) do
    groups = Repo.all(Group)
    render(conn, "index.html", groups: groups)
  end

  def new(conn, _params) do
    changeset = Group.changeset(%Group{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"group" => group_params}) do
    changeset = Group.changeset(%Group{user_id: conn.assigns.current_user.id}, group_params)

    case Repo.insert(changeset) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "#{group.title} created successfully.")
        |> redirect(to: group_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    group = Repo.get!(Group, id)
    render(conn, "show.html", group: group)
  end

  def edit(conn, %{"id" => id}) do
    group = Repo.get!(Group, id)
    changeset = Group.changeset(group)
    render(conn, "edit.html", group: group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = Repo.get!(Group, id)
    changeset = Group.changeset(group, group_params)

    case Repo.update(changeset) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Group updated successfully.")
        |> redirect(to: group_path(conn, :show, group))
      {:error, changeset} ->
        render(conn, "edit.html", group: group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = Repo.get!(Group, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(group)

    conn
    |> put_flash(:info, "Group deleted successfully.")
    |> redirect(to: group_path(conn, :index))
  end
end
