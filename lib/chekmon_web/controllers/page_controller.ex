defmodule ChekmonWeb.PageController do
  use ChekmonWeb, :controller

  alias Chekmon.Users
  alias Chekmon.Users.User

  def index(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "index.html", changeset: changeset)
  end
end
