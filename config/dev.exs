import Config

config :spiderslab, Spiderslab.Repo,
  database: "spiderslab",
  username: "fearless",
  password: "fearless",
  hostname: "localhost"

config :spiderslab, ecto_repos: [Spiderslab.Repo]
