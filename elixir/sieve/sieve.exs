defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    Enum.reduce(2..limit, [], fn(x, acc) -> acc ++ is_prime?(x) end)
  end

  defp is_prime?(2), do: [2]
  defp is_prime?(x) do
    if Enum.any?(3..x, fn(y) -> rem(x,y-1) == 0 end) do
      []
    else
      [x]
    end
  end


end
