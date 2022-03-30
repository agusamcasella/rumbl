# defmodule Rumbl.Accounts.User do
#   defstruct [:id, :name, :username]
# end

# Ahora usamos schema para matchear las cosas en la base de datos,, pero tambien es como un struct para elixir
defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do #por defecto lleva id, y gracias a las macros schema y field,, esto es tanto el struct para elixir como la tabla de la base de datos
    field :name, :string
    field :username, :string
    timestamps()
  end
end
