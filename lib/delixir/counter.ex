defmodule Delixir.Counter.Supervisor do
  use DynamicSupervisor

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def register(worker_name) do
    DynamicSupervisor.start_child(__MODULE__, worker_name)
  end
end

defmodule Delixir.Counter do
  use GenServer

  # Client

  def start_link(initial_count \\ 0) do
    GenServer.start_link(__MODULE__, initial_count, name: :counter)
  end

  def increment() do
    GenServer.cast({:via, :swarm, :counter}, :increment)
  end

  def show() do
    GenServer.call({:via, :swarm, :counter}, :show)
  end

  # Server (callbacks)

  @impl true
  def init(_) do
    {:ok, 0}
  end

  @impl true
  def handle_call(:show, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end
end
