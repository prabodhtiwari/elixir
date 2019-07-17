defmodule LifeUniverseEverything do
  @doc """
  Simply returns "Hello, World!"
  """
  def scan do
    IO.puts util()
  end

  def util do
    {a, _} = IO.gets(" ") |> Integer.parse
    if a != 42 do
        scan()
        a
    end
  end

end
LifeUniverseEverything.scan()
