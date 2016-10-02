defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    do_count(l, 0)
  end
  defp do_count([], count), do: count
  defp do_count([_h | t], count), do: do_count(t, count + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse([], l)
  end
  defp do_reverse(acc, []), do: acc
  defp do_reverse(acc, [h | t]) do
    [h | acc]
    |> do_reverse(t)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map([], l, f)
  end
  defp do_map(acc, [], _f), do: reverse(acc)
  defp do_map(acc, [h | t], f) do
    new_h = f.(h)
    [new_h | acc]
    |> do_map(t, f)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter([], l, f)
  end
  defp do_filter(acc, [], _f), do: reverse(acc)
  defp do_filter(acc, [h | t], f) do
    case f.(h) do
      true -> [h | acc] |> do_filter(t, f)
      false -> do_filter(acc, t, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    do_reduce(acc, l, f)
  end
  defp do_reduce(acc, [], _f), do: acc
  defp do_reduce(acc, [h | t], f) do
    f.(h, acc)
    |> do_reduce(t, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(b, reverse(a), fn(x, acc) -> [x | acc] end)
    |> reverse
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    do_concat([], ll)
  end
  defp do_concat(acc, []), do: acc |> reverse
  defp do_concat(acc, [h | t]) do
    reduce(h, acc, fn(x, acc) -> [x | acc] end)
    |> do_concat(t)
  end
end
