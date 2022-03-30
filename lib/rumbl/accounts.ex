defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context
  Aqui va la logica de accounts
  Ahora con logica para traer los datos de la base de datos
  Se puso los datos de manera estatica al principio por no empezar de una con base de datos.
  """
  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def list_users do
    Repo.all(User)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end

# def list_users do
#   [
#     %User{id: "1", name: "Jose", username: "josevalim"},
#     %User{id: "2", name: "Bruce", username: "redrapids"},
#     %User{id: "3", name: "Chris", username: "chrismccord"}
#   ]
# end
# Aca era un get user, pero de la coleccion estatica de los users harcodeados
# def get_user(id) do
#   Enum.find(list_users(), fn map -> map.id === id end)
# end
# traer un usuario segun un parametro de los usuarios hardcodeados mas arriba
# def get_user_by(params) do
#   Enum.find(list_users(), fn map ->
#     Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
#   end)
# end
