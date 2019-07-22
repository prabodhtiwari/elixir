defmodule SubStringCheck do
  @doc """
  Simply returns "Hello, World!"
  """

  def check do
    a = IO.gets("String 1: ") |> String.trim
    b = IO.gets("String 2: ") |> String.trim

    #if String.contains?(String.trim(a), String.trim(b)) do
    if Regex.match?(~r/#{b}/, a) do
      IO.puts "String 2 is subset of string 1."
    else
      IO.puts "String 2 is not a subset of string 1."
    end

  end

end
SubStringCheck.check()
