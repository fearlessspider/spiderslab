defmodule Spiderslab.Web.HomeHandler do
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
end
