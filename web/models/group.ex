defmodule Org.Group do
  use Org.Web, :model

  schema "groups" do
    field :title, :string
    field :url, :string
    field :description, :string
    belongs_to :user, Org.User

    timestamps
  end

  @required_fields ~w(title url description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    # |> Ecto.Changeset.validate_required(@required_fields ++ ["user_id"])
    |> assoc_constraint(:user)
  end
end
