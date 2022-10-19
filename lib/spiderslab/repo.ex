defmodule Spiderslab.Repo do
  use Ecto.Repo,
    otp_app: :spiderslab,
    adapter: Ecto.Adapters.Postgres
end
