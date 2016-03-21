defmodule Org.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :avatar, :string
      add :bio, :string
      add :blog, :string
      add :company, :string
      add :created_at, :string
      add :email, :string
      add :followers, :integer
      add :following, :integer
      add :hireable, :boolean, default: false
      add :html_url, :string
      add :github_id, :integer
      add :location, :string
      add :login, :string
      add :name, :string
      add :public_gists, :integer
      add :public_repos, :integer
      add :role, :string, default: "user"
      add :type, :string

      timestamps
    end
    create unique_index(:users, [:github_id])

  end
end
