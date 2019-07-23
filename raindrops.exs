defmodule Raindrops do
  @map %{3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}

  @doc """
  Returns a string based on raindrop factors.



  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Enum.map(Map.keys(@map), fn x -> _check(number, x) end)
    |> Enum.join("")
    |>_retrun(number)
  end

  def _check(number, factor) do
    if rem(number, factor) == 0 do
      @map[factor]
    end
  end

  def _retrun(string, number)  when string == "" do Integer.to_string(number) end
  def _retrun(string, _) do string end

end
