defmodule Chekmon.CurrentUser do
  import Plug.Conn

  alias Chekmon.Repo
  alias Chekmon.Users.User

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :current_user_id)

    cond do
      user_id ->
        user = Repo.get(User, user_id)
        assign(conn, :current_user, user)
      true ->
        assign(conn, :current_user, nil)
    end
  end
end
