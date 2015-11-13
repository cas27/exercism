defmodule Allergies do
  @allergies %{128 => "cats",
               64 => "pollen",
               32 => "chocolate",
               16 => "tomatoes",
               8 => "strawberries",
               4 => "shellfish",
               2 => "peanuts",
               1 => "eggs"
              }
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags, allergies \\ MapSet.new) do
    build_set(flags, allergies)
  end

  defp build_set(0, allergies), do: allergies
  defp build_set(flags, allergies) do
    first_allergy = Enum.find(
      Enum.reverse(Map.keys(@allergies)), fn(x) -> x <= flags end)
    if first_allergy do
      allergies = MapSet.put(
        allergies, Map.fetch!(@allergies, first_allergy))
    end
    build_set(flags - first_allergy, allergies)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    allergies = list(flags)
    case Set.size(Set.intersection(allergies, Enum.into([item], MapSet.new))) do
      0 -> false
      _ -> true
    end
  end
end
