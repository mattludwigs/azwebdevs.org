defmodule Org.User do
  use Org.Web, :model

  schema "users" do
    field :avatar, :string
    field :bio, :string
    field :blog, :string
    field :company, :string
    field :created_at, :string
    field :email, :string
    field :followers, :integer
    field :following, :integer
    field :github_id, :integer
    field :hireable, :boolean, default: false
    field :html_url, :string
    field :location, :string
    field :login, :string
    field :name, :string
    field :public_gists, :integer
    field :public_repos, :integer
    field :role, :string, default: "user"
    field :type, :string
    has_many :groups, Org.Group

    timestamps
  end

  @required_fields ~w(avatar created_at email followers following html_url github_id login name public_gists public_repos role type)
  @optional_fields ~w(bio blog company hireable location)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:github_id)
  end
end
