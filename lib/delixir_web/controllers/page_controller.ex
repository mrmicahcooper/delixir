defmodule DelixirWeb.PageController do
  use DelixirWeb, :controller

  def index(conn, _params) do
    Delixir.Counter.increment()
    render(conn, "index.html")
  end
end
