defmodule DelixirWeb.PageController do
  use DelixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
