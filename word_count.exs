
defmodule Words do

  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> split
    |> count_words
  end

  defp split(sentence), do: String.split(sentence, " " )

  defp count_words(words) do
    Enum.reduce(words, Map.new, &count_word/2)
  end

  defp count_word(word, words) do
    lower_word = String.downcase(word)
    Map.update(words, lower_word, 1, fn(value) -> value + 1 end)
  end
end

