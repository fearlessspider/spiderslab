defmodule Spiderslab.Web.HomeHandler do
  import Spiderslab.Utils.Conn

  @template_path "lib/spiderslab/web/templates"

  def init(req, state) do
    resp =
      :cowboy_req.reply(
        _status = 200,
        _headers = %{"content-type" => "text/html; charset=utf-8"},
        _body = "<h1>Welcome in Spiderslab!</h1>",
        _request = req
      )

    {:ok, resp, []}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end

  def render(conn, name) do
    conn = assign(conn, :adj, "great")
    body = EEx.eval_file("#{@template_path}/#{name}.eex", Enum.to_list(conn.assign))
    put_resp_body(conn, body)
  end

  defp get_templates() do
    for t <- Path.wildcard("#{@template_path}/*.eex"),
        do: Path.basename(t, ".eex")
  end
end
