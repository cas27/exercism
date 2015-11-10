defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    build_factors(number, 2, [])
  end

  defp build_factors(number, factor, acc) when factor > number do
    acc
  end

  defp build_factors(number, factor, acc) when rem(number, factor) == 0 do
    [factor | build_factors(div(number, factor), factor, acc)]
  end

  defp build_factors(number, factor, acc) do
    build_factors(number, factor + 1, acc)
  end
end
