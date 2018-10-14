defmodule Fib do

  @moduledoc """
  We implement a simple key/value cache. State is stored in an Agent, in
  the form of a map.
  The function `lookup` tries to look the value up in the cache, and then
  calls `complete_if_not_found`. This takes two forms. If there was
  no value in the cache, it calls the function passed in by the client
  to supply it, updating the cache at the same time.
  Otherwise, it simply returns the cached value.
  """

  @doc """
  Start the cache, run the supplied function, then stop the cache.
  
  Eventually we'll be able to do better than this.
  """
  
  def run(body) do
    # { :ok, pid } = Cache.start_link(fn -> %{ 0 => 0, 1 => 1 } end)
    pid = Cache.init(fn _state -> %{ 0 => 0, 1 => 1 } end)
    result = body.()
    # Cache.stop(pid)
    result
  end
 
  def lookup(n, if_not_found) do
    Cache.get(fn map -> map[n] end)
    |> complete_if_not_found(n, if_not_found)
  end

  defp complete_if_not_found(nil, n, if_not_found) do
    if_not_found.()
    |> set(n)
  end

  defp complete_if_not_found(value, _n, _if_not_found) do
    value
  end
  
  defp set(val, n) do
    Cache.get_and_update(fn map ->
      { val, Map.put(map, n, val)}
    end)
  end
end


defmodule CachedFib do

  def fib(n) do
    Fib.run(fn ->
      cached_fib(n)
    end)
  end

  defp cached_fib(n) do
    Fib.lookup(n, fn ->
      cached_fib(n-2) + cached_fib(n-1)
    end)
  end

end
