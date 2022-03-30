defmodule Rumbl.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create_table(:users) do
      add :name, :string
      add :username, :string, null: false
      add :password_hash, :string

      timestamps()
    end

    # para garantizar que el username sea unico en la tabla
    create unique_index(:users, [:username])
  end
end
