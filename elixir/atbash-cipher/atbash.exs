defmodule Atbash do
  @plain  'abcdefghijklmnopqrstuvwxyz1234567890'
  @cipher 'zyxwvutsrqponmlkjihgfedcba1234567890'

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    Regex.scan(~r/\w+/, String.downcase(plaintext))
    |> List.to_string
    |> String.to_char_list
    |> swap_plain_to_cipher
    |> split_by_five
    |> List.to_string
  end

  defp swap_plain_to_cipher(list_of_chars) do
    List.foldl(list_of_chars, '',
      fn(x, acc) -> acc ++ [swap_letter_to_cipher(x)] end)
  end

  defp swap_letter_to_cipher(letter) do
    index = Enum.find_index(@plain, fn(x) -> [x] == [letter] end)
    Enum.at @cipher, index
  end

  defp split_by_five(list_of_chars) do
    Enum.reduce(list_of_chars, '', fn(x, acc) ->
      cond do
        Enum.count(acc) == 0 -> acc ++ [x]
        rem(Enum.count(replace_space(acc)), 5) == 0 -> acc ++ ' ' ++ [x]
        :else -> acc ++ [x]
      end
    end)
  end

  defp replace_space(char_list) do
    char_list
    |> List.to_string
    |> String.replace(" ", "")
    |> String.to_char_list
  end
end
