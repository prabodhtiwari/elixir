defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, _size) do
    util(String.graphemes(_s), _size, [])
  end

  defp util(_, size, _) when size <= 0, do: []
  defp util(s, size, acc) when length(s) < size, do: acc |> Enum.reverse
  defp util(s, size, acc) do
    substr = s
    |> Enum.take(size)
    |> Enum.join

    rest = s |> Enum.drop(1)

    util(rest, size, [substr|acc])
  end
end
