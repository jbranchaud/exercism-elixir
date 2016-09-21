defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.flat_map(factors, &(do_to(&1, &1, limit, [])))
    |> MapSet.new
    |> Enum.sum
  end

  def do_to(factor, multiple, limit, multiples) when multiple < limit do
    multiples = [multiple | multiples]
    do_to(factor, multiple + factor, limit, multiples)
  end
  def do_to(_factor, _multiple, _limit, multiples), do: multiples
end
