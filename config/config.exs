# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :delixir, DelixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "akYw1VPY03Pqk5vQNiYiX7weZbtAls1aerq3KFf95c7dHcWNxL7iEQMkL6bp1k4k",
  render_errors: [view: DelixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Delixir.PubSub,
  live_view: [signing_salt: "eFHKOSka"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
