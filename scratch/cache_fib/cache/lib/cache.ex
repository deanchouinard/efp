defmodule Cache do
  def start_link(init) do
    Agent.start_link(init)
  end

  def stop(pid) do
    Agent.stop(pid)
  end

  def get(cache, getter) do
    Agent.get(cache, getter)
  end

  def get_and_update(cache, updater) do
    Agent.get_and_update(cache, updater)
  end

end
