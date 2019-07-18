defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  #String.replace(text, <<char::utf8>>, <<get_rotated_char(char, shift)::utf8>>)
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    chars = String.graphemes(text)
    list = Enum.map chars, fn char ->
      <<get_rotated_char(char, shift)::utf8>>
    end
    Enum.join(list)
  end

  @spec get_rotated_char(char :: String.t(), shift :: integer) :: integer
  def get_rotated_char(char, shift) do
    <<aacute::utf8>> = char
    cond do
      (aacute >= ?A && aacute <= ?Z) ->
        util(aacute + shift, ?A, ?Z)
      (aacute >= ?a && aacute <= ?z) ->
        util(aacute + shift, ?a, ?z)
      true ->
        aacute
    end

  end

  @spec util(a :: integer, b :: integer, c :: integer) :: integer
  def util(a, b ,c) do
      if a > c do
        a - c + b - 1
      else
        a
      end
  end

end
