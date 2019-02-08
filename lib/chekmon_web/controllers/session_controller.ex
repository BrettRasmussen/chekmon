defmodule ChekmonWeb.SessionController do
  use ChekmonWeb, :controller

  alias Chekmon.Users.User
  alias Chekmon.Auth

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Auth.authenticate(email, password) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Welcome back, #{user.given_name}")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Login failed")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
