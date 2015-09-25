defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    input
    |> Enum.reduce %{}, &swap_them(&1, &2)
  end

  defp swap_them({key, values}, acc) do
    Enum.reduce(values, %{},
      fn(x,acc) -> Map.put(acc, String.downcase(x), key) end)
    |> Map.merge(acc)
  end
end
