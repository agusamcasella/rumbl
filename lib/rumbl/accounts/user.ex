# defmodule Rumbl.Accounts.User do
#   defstruct [:id, :name, :username]
# end

# Ahora usamos schema para matchear las cosas en la base de datos,, pero tambien es como un struct para elixir
defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # por defecto lleva id, y gracias a las macros schema y field,, esto es tanto el struct para elixir como la tabla de la base de datos
  schema "users" do
    field :name, :string
    field :username, :string
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end
