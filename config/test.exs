import Config

config :spiderslab, Spiderslab.Repo,
  username: "fearless",
  password: "fearless",
  database: "spiderslab_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
