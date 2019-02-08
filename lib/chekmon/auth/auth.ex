defmodule Chekmon.Auth do
  alias Chekmon.Repo
  alias Chekmon.Users.User

  def authenticate(email, password) do
    user = Repo.get_by(User, email: email)

    cond do
      user && user.password == password ->
        {:ok, user}
      true ->
        {:error, :unauthorized}
    end
  end
end
