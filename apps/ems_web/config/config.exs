# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ems_web,
  namespace: EMSWeb,
  ecto_repos: [EMS.Repo]

# Configures the endpoint
config :ems_web, EMSWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kPG8b95PxoGpSqCyeKeCoVPRp6ANNgvdygbjcf6UntFoCUp7Yb8FSmzInCgeAtvY",
  render_errors: [view: EMSWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EMSWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ems_web, :generators, context_app: :ems

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
