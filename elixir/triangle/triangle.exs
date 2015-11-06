defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, "all side lengths must be positive"}
  end
  def kind(a, b, c) when a+b <= c or b+c <= a or a+c <= b do
    {:error, "side lengths violate triangle inequality"}
  end
  def kind(a, b, c) do
    case number_of_unique_side_lengths([a, b, c]) do
      1 -> {:ok, :equilateral}
      2 -> {:ok, :isosceles}
      3 -> {:ok, :scalene}
      _ -> {:error, "Not a triangle"}
    end
  end

  defp number_of_unique_side_lengths(sides) do
    Enum.uniq(sides)
    |> Enum.count
  end
end
