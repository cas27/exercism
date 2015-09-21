defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  def count([],_), do: 0
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, &(increment_on_match(&1, nucleotide) + &2))
  end

  def increment_on_match(test, nucleotide) do
    if test == nucleotide do
     1
    else
     0
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    count = Enum.reduce(@nucleotides, %{}, &Map.put(&2,&1,0))
    Enum.reduce(strand, count, &Map.update(&2,&1,0, fn(x) -> x + 1 end))
  end
end
