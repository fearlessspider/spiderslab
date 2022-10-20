defmodule Spiderslab.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Spiderslab.Repo

      import Ecto
      import Ecto.Query
      import Spiderslab.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Spiderslab.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Spiderslab.Repo, {:shared, self()})
    end

    :ok
  end
end
