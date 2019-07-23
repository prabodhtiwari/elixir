defmodule ReturnMatches do
  @doc """
  Simply returns matched words
  """

  def check do
    a = IO.gets("String 1: ") |> String.trim
    b = IO.gets("String 2: ") |> String.trim
    Regex.scan(~r/?#{b}?/, a)
    |> Enum.map(fn x -> IO.puts x end)
  end
end

ReturnMatches.check()
