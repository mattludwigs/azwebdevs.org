defmodule OrgApi.UserView do
  use OrgApi.Web, :view

  attributes [:name]

  def render("index.json", %{users: users}) do
    %{data: render_many(users, OrgApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, OrgApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name}
  end
end
