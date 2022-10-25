defmodule Spiderslab.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    start_cowboy()

    children = [
      # Starts a worker by calling: Spiderslab.Worker.start_link(arg)
      # {Spiderslab.Worker, arg}
      Spiderslab.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spiderslab.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_cowboy() do
    static = {"/static/[...]", :cowboy_static, {:priv_dir, :spiderslab, "static"}}
    home = {"/", Spiderslab.Web.HomeHandler, []}
    others = {:_, Spiderslab.Web.NotFoundHandler, []}

    dispatch = :cowboy_router.compile([{:_, [static, home, others]}])

    opts = [{:port, 4000}]
    env = %{ env: %{dispatch: dispatch}}

    case :cowboy.start_clear(:http, opts, env) do
      {:ok, _pid} -> IO.puts("Cowboy is now running. Go to http://localhost:4000.")
      _ -> IO.puts("There was an error starting Cowboy web server.")
    end
  end
end
