defmodule Spiderslab.Router do
  use Plug.Router
  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Welcome to Spiderlab!")
  end

  match _ do
    send_resp(conn, 404, "Guru Meditation!")
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Guru meditation!")
  end
end
