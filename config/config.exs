# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chekmon,
  ecto_repos: [Chekmon.Repo]

# Configures the endpoint
config :chekmon, ChekmonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HmQ2V95g3ePjusGE+o/BAhS8zYv27rzDVM2pdPtnjt69CzTvSCaVmtLarGNn/Yzu",
  render_errors: [view: ChekmonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chekmon.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
