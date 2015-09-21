defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    remove_duplicates(base, candidates)
    |> remove_subsets(base)
    |> is_anagram?(base)
  end

  defp is_anagram?([]), do: true
  defp is_anagram?(_), do: false
  defp is_anagram?(candidates, base) when is_list(candidates) do
    Enum.filter(candidates, &is_anagram?(String.downcase(base), String.downcase(&1)))
  end
  defp is_anagram?(base, candidate), do: is_anagram?(String.to_char_list(candidate) -- String.to_char_list(base))

  defp remove_duplicates(base, candidates) do
    Enum.filter(candidates, fn(x) -> String.length(x) == String.length(base) end)
  end

  defp remove_subsets(candidates, base) do
    Enum.filter(candidates, fn(x) -> String.downcase(x) != String.downcase(base) end)
  end
end
