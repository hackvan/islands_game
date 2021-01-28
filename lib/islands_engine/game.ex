defmodule IslandsEngine.Game do
  use GenServer

  def handle_info(:first, state) do
    IO.puts "This message has been handled by handle_info/2 matching on :first."
    {:noreply, state}
  end

  def handle_call(:demo_call, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:demo_cast, new_value}, state) do
    {:noreply, Map.put(state, :test, new_value)}
  end

  @spec demo_call(pid) :: Map.t()
  def demo_call(game) do
    GenServer.call(game, :demo_call)
  end

  @spec demo_cast(pid, String.t()) :: :ok
  def demo_cast(pid, new_value) do
    GenServer.cast(pid, {:demo_cast, new_value})
  end
end
