defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      true -> is_sub_or_super(a,b)
    end
  end

  def is_sub_or_super(a,b) when length(a) > length(b) do
    do_compare(a,b,a,b) || :superlist
  end
  def is_sub_or_super(a,b) when length(a) < length(b) do
    do_compare(b,a,b,a) || :sublist
  end
  def is_sub_or_super(_a,_b), do: :unequal

  def do_compare(_full_a, _full_b, _a, []), do: nil
  def do_compare(a, b, [head | a_tail], [head | b_tail]) do
    do_compare(a, b, a_tail, b_tail)
  end
  def do_compare(_a, full_b, [_a_head | a_tail], _b)
    when length(full_b) <= length(a_tail) do
    do_compare(a_tail, full_b, a_tail, full_b)
  end
  def do_compare([_head | full_a_tail] = full_a, full_b, _a, _b)
    when length(full_b) < length(full_a) do
    do_compare(full_a_tail, full_b, full_a_tail, full_b)
  end
  def do_compare(_a, _b, _c, _d), do: :unequal
end
