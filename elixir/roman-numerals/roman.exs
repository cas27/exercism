defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number, acc \\ "") do
    cond do
      number >= 1000 -> numerals(number - 1000, acc <> "M")
      number >= 900 -> numerals(number - 900, acc <> "CM")
      number >= 550 -> numerals(number - 550, acc <> "DL")
      number >= 400 -> numerals(number - 400, acc <> "CD")
      number >= 100 -> numerals(number - 100, acc <> "C")
      number >= 90 -> numerals(number - 90, acc <> "XC")
      number >= 50 -> numerals(number - 50, acc <> "L")
      number >= 40 -> numerals(number - 40, acc <> "XL")
      number >= 10 -> numerals(number - 10, acc <> "X")
      number >= 9 -> numerals(number - 9, acc <> "IX")
      number >= 5 -> numerals(number - 5, acc <> "V")
      number == 4 -> numerals(number - 4, acc <> "IV")
      number > 0 -> numerals(number - 1, acc <> "I")
      :else -> acc
    end
  end
end
