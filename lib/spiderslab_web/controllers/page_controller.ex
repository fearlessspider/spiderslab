defmodule SpiderslabWeb.PageController do
  use SpiderslabWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
