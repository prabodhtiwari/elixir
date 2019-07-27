defmodule SecretHandshake do

  use Bitwise, only_operators: true
  @commands_map %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Enum.reduce(@commands_map, [], fn {key, command}, acc -> util(code &&& key, (code &&& 16) != 0, command, acc) end)

  end

  defp  util(0, _, _, acc), do: acc
  defp  util(_, true, command, acc), do: [command] ++ acc
  defp  util(_, _, command, acc), do: acc ++ [command]

end
