defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_nuc(nucleotide) && histogram(strand)[nucleotide]
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    starter = Enum.reduce(@nucleotides, %{}, fn(x, acc) -> Map.put(acc, x, 0) end)
    Enum.reduce(strand, starter, &add_to_histogram/2)
  end

  defp add_to_histogram(nuc, acc) do
    validate_nuc(nuc) && Map.put(acc, nuc, Map.get(acc, nuc, 0) + 1)
  end

  defp validate_nuc(nuc) do
    Enum.member?(@nucleotides, nuc) || raise ArgumentError
  end
end
