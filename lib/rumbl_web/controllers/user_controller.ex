defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
# responde a lo que le tira el router y llama a quien tenga que llamar
  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end
end
