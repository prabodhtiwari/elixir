defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> lower_case()
    |> split()
    |> count_words()
  end

  defp lower_case(sentence), do:  String.downcase(sentence)

  defp split(sentence), do: String.split(sentence, ~r/([^\w\-]| |_)/u, trim: true )

  defp count_words(words), do: Enum.reduce(words, Map.new, &count_word/2)
  defp count_word(word, words), do: Map.update(words, word, 1, fn(value) -> value + 1 end)

end
