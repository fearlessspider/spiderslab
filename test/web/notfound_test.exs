defmodule Web.NotfoundTest do
  use ExUnit.Case

  test "returns Welcome in Spiderslab!" do
    assert {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, '<h1>Welcome in Spiderslab!</h1>'}} = :httpc.request('http://localhost:4000/')
  end
end
