defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case check_prime_factors(number) do
      [3] -> "Pling"
      [5] -> "Plang"
      [7] -> "Plong"
      [3,5] -> "PlingPlang"
      [3,7] -> "PlingPlong"
      [5,7] -> "PlangPlong"
      [3,5,7] -> "PlingPlangPlong"
      _ -> Integer.to_string number
    end
  end

  defp check_prime_factors(number) do
    Enum.filter [3,5,7], fn(x) -> rem(number, x) == 0 end
  end
end
