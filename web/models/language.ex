defmodule Org.Language do
  use Org.Web, :model

  embedded_schema do
    field :es5, :boolean
    field :es6, :boolean
    field :es7, :boolean
    field :rails, :boolean
    field :dotnet, :boolean
    field :python, :boolean
    field :php, :boolean
  end

  @required_fields ~w()
  @optional_fields ~w(es5 es6 es7 rails dotnet python php)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
