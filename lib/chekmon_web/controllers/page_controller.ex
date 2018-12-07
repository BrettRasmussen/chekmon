defmodule ChekmonWeb.PageController do
  use ChekmonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
