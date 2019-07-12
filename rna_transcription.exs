defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn char -> util(<<char>>) end )
  end

  @spec util([char]) :: [char]
  def util(char) do
    cond do
      char == "G" ->
        ?C
      char == "C" ->
        ?G
      char == "T" ->
        ?A
      char == "A" ->
        ?U
    end
  end
end
