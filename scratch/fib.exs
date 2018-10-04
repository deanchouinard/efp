defmodule Fib do

  def fib(0) do
    # IO.puts "*n: #{0}"
    0
  end
  def fib(1) do
    # IO.puts "*n: #{1}"
    1
  end
  def fib(n) do
    #    IO.puts "n: #{n}"
    fib(n-1) + fib(n-2)
  end
end

IO.puts "#{Fib.fib(3)}"


