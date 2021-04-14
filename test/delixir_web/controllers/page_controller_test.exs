defmodule DelixirWeb.PageControllerTest do
  use DelixirWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Distributed Elixir for fun and profit"
  end
end
