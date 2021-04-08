defmodule DelixirWeb.PageController do
  use DelixirWeb, :controller

  def index(conn, _params) do
    Delixir.Counter.increment()
    self_node = inspect(node())
    nodes = Node.list()
    render(conn, "index.html", %{node: self_node, nodes: nodes})
  end
end
