defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> _remove
    |> _lower_case
    |> _split
    |> _count_words
  end

  defp _remove(sentence), do: String.replace(sentence, ~r/[^-_a-zA-Z0-9äöüÄÖÜ ]/, "")

  defp _lower_case(sentence), do:  String.downcase(sentence)

  defp _split(sentence), do: String.split(sentence, [" ", "_"], trim: true )

  defp _count_words(words), do: Enum.reduce(words, Map.new, &_count_word/2)
  defp _count_word(word, words), do: Map.update(words, word, 1, fn(value) -> value + 1 end)

end
