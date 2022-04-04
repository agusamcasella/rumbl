defmodule RumblWeb.UserView do
  use RumblWeb, :view
  alias Rumbl.Accounts
  # aca se le da forma al usuario para ser impreso en pantalla..
  # y se lo usa en el template directamente
  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
