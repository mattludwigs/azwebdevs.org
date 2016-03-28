defmodule Org.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :url, :string
      add :description, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps
    end
    create index(:groups, [:user_id])

  end
end
