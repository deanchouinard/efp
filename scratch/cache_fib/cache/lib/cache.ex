defmodule Cache do
  use Agent

  def start_link(_init) do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def init(init_data) do
    Agent.update(__MODULE__, init_data)
  end

  def stop(pid) do
    Agent.stop(pid)
  end

  def get(getter) do
    Agent.get(__MODULE__, getter)
  end

  def get_and_update(updater) do
    Agent.get_and_update(__MODULE__, updater)
  end

end
