defmodule ChekmonWeb.Router do
  use ChekmonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :logged_in do
    plug Chekmon.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChekmonWeb do
    pipe_through [:browser, :logged_in]

    get "/", PageController, :index

    get "/signup", UserController, :new
    resources "/users", UserController

    get "/logout", SessionController, :delete
    resources "/sessions", SessionController, only: [:create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChekmonWeb do
  #   pipe_through :api
  # end
end
