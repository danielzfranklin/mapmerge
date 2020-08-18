# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mapmerge,
  ecto_repos: [Mapmerge.Repo]

# Configures the endpoint
config :mapmerge, MapmergeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qS/ty49sUo6ToIIFtdLclSj5ezFQG8KKPqhHHh1GFvZ+kM5o/d5ZfiiZa8752gGU",
  render_errors: [view: MapmergeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Mapmerge.PubSub,
  live_view: [signing_salt: "weGovo3ReIEDbWZneziFf2N4RXu1fUUi"]

config :mapmerge, :mapbox,
  token:
    "sk.eyJ1IjoiZHpmcmFua2xpbiIsImEiOiJja2R0aHdidHExY3RmMnFtc3F0b2g2amU0In0.AS1a5ewomszcX6Q2JqUrnw"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
