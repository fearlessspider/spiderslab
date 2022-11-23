import Config

config :spiderslab, Spiderslab.Repo,
  database: "spiderslab",
  username: "fearless",
  password: "fearless",
  hostname: "localhost"

config :spiderslab, ecto_repos: [Spiderslab.Repo]
config :spiderslab, cowboy_port: 4000
import_config "#{Mix.env()}.exs"
