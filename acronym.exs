defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> split()
    |> Enum.map(fn x -> String.upcase(List.first(x)) end)
    |> List.flatten()
    |> List.to_string
    |> remove()
  end

  defp split(sentence), do: Regex.scan(~r/( [a-z]|[A-Z])/u, sentence)
  defp remove(sentence), do: String.replace(sentence, ~r/( )/u, "")

end
