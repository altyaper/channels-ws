# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :channels, Channels.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T5XzM52l4v91MZfUw9Kf/8Zuyw/4p79H+SwKqb9auJLbDEoUMjxz3eUmsB4GTloj",
  render_errors: [view: Channels.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Channels.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
