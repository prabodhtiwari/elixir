defmodule Fib do
  def fib(a, _, 0), do: a
  def fib(a, b, n) do
    fib(b, a+b, n-1)
  end
end


IO.puts Fib.fib(1,1,4)
