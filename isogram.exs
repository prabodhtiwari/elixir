defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    c = chars(sentence)
    c == Enum.uniq(c)
  end

  defp chars(sentence), do: Regex.scan(~r/[a-zA-Z]/u, sentence)
end
