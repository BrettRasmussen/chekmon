defmodule Chekmon.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :string
      add :given_name, :string
      add :surname, :string

      timestamps()
    end

  end
end
