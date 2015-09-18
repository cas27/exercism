defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal
  def compare(a, b) when length(a) == length(b), do: :unequal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist
  def compare(a, b) do
    if length(a) < length(b) do
      cond do
        sublist?(a,b) -> :sublist
        :true -> :unequal
      end
    else
      :superlist
    end
  end

  defp sublist?(a,b) do
    a_size = Enum.count(a)
    cond do
      a === Enum.take(b, a_size) -> true
      lower_list?(a,b) -> true
      true -> false
     end
  end

  defp lower_list?(_, []), do: false
  defp lower_list?(a, [_|t]) do
    if a == Enum.take(t, length(a)) do
      true
    else
      if length(a) >= length(t) do
        false
      else
        lower_list?(a, t)
      end
    end
  end
end
