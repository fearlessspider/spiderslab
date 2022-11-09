defmodule Spiderslab.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Spiderslab.Worker.start_link(arg)
      # {Spiderslab.Worker, arg}
      Spiderslab.Repo,
      {Plug.Cowboy, scheme: :http, plug: Spiderslab.Router, options: [port: cowboy_port()]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spiderslab.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:spiderslab, :cowboy_port, 4000)
end
