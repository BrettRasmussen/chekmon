defmodule Chekmon.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :given_name, :string
    field :surname, :string
    field :password, :string
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :given_name, :surname])
    |> validate_required([:email, :given_name, :surname])
    |> validate_confirmation(:password, message: "Passwords need to match.")
  end
end
