defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &rna_map(&1))
  end

  defp rna_map(?G), do: ?C
  defp rna_map(?C), do: ?G
  defp rna_map(?T), do: ?A
  defp rna_map(?A), do: ?U
end
