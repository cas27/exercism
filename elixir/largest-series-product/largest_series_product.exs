defmodule Series do

  @doc """
  Splits up the given string of numbers into an array of integers.
  """
  @spec digits(String.t) :: [non_neg_integer]
  def digits(number_string) do
    number_string
    |> String.split("", trim: true)
    |> Enum.reduce([], fn(x, acc) -> acc ++ [String.to_integer(x)] end)
  end

  @doc """
  Generates sublists of a given size from a given string of numbers.
  """
  @spec slices(String.t, non_neg_integer) :: [list(non_neg_integer)]
  def slices(number_string, size) do
    digits(number_string)
    |> Enum.chunk(size, 1)
  end

  def largest_product("", _), do: 1
  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(number_string, size) do
    [head | tail] = slices(number_string, size)
    |> Enum.reduce([], fn(x, acc) -> acc ++
      [Enum.reduce(x, &(&1 * &2))]
    end)
    |> Enum.sort(&(&1 > &2))
    head
  end
end
