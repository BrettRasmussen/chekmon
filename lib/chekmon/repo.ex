defmodule Chekmon.Repo do
  use Ecto.Repo,
    otp_app: :chekmon,
    adapter: Ecto.Adapters.Postgres
end
