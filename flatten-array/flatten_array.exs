defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten([], list) |> Enum.reverse
  end

  defp do_flatten(acc, []), do: acc
  defp do_flatten(acc, [nil | t]), do: do_flatten(acc, t)
  defp do_flatten(acc, [h | t]) when is_list(h) do
    new_acc = do_flatten(acc, h)
    do_flatten(new_acc, t)
  end
  defp do_flatten(acc, [h | t]) do
    new_acc = [h | acc]
    do_flatten(new_acc, t)
  end
end
