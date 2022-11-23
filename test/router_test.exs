defmodule Spiderslab.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias Spiderslab.Router

  @content "Welcome to Spiderslab!"
  @mimetype "text/html"

  @opts Router.init([])

  test "return welcome" do
    conn =
      :get
      |> conn("/", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "return 404" do
    conn =
      :get
      |> conn("/aaa", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end
