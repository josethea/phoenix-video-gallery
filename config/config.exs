# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixvideogallery,
  ecto_repos: [Phoenixvideogallery.Repo]

# Configures the endpoint
config :phoenixvideogallery, Phoenixvideogallery.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HF1j2eMEChFf3Q94RmbBLNfiT3R03I6Jo4nd0qdOAGk93HHn1OeIi0h4ykqMnycq",
  render_errors: [view: Phoenixvideogallery.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixvideogallery.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
  ]
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
