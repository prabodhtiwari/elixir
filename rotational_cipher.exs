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

  def get_rotated_char(char, shift) do
    <<aacute::utf8>> = char
    cond do
      (aacute >= ?A && aacute <= ?Z) ->
        a = aacute + shift
        if a > ?Z do
          a - ?Z + ?A - 1
        else
          a
        end
      (aacute >= ?a && aacute <= ?z) ->
        a = aacute + shift
        if a > ?z do
          a - ?z + ?a - 1
        else
          a
        end
      true ->
        aacute
    end

  end

end
