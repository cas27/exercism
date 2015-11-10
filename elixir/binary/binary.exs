defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    case Integer.parse(string, 2) do
      :error -> 0
     {value, _} -> value
    end
  end
end
