# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kenshusei,
  ecto_repos: [Kenshusei.Repo]

# Configures the endpoint
config :kenshusei, KenshuseiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UlHh0a5QPLTgdwyhWzMGETmaxo8HU6uWKAu94+mrBdKiZSqtarDmun7BSmivsK3X",
  render_errors: [view: KenshuseiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kenshusei.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure Sendgrid Mailer
config :kenshusei, Kenshusei.Mailer,
adapter: Bamboo.SendgridAdapter,
api_key: System.get_env("SENDGRID_API_KEY")

# Configure Recaptcha
config :recaptcha,
public_key: System.get_env("RECAPTCHA_PUBLIC_KEY"),
secret: System.get_env("RECAPTCHA_PRIVATE_KEY")
# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Kenshusei.Coherence.User,
  repo: Kenshusei.Repo,
  module: Kenshusei,
  web_module: KenshuseiWeb,
  router: KenshuseiWeb.Router,
  messages_backend: KenshuseiWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, KenshuseiWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_API_KEY")
# %% End Coherence Configuration %%
