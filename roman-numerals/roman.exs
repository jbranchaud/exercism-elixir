defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    do_numerals(number, [])
    |> Enum.join
  end

  def do_numerals(0, acc), do: Enum.reverse(acc)
  def do_numerals(base, acc) when base >= 1000 do
    lead = base / 1000 |> Kernel.trunc
    new_remainder = rem(base, 1000)
    acc = [to_roman(lead, 1000) | acc]
    do_numerals(new_remainder, acc)
  end
  def do_numerals(base, acc) when base >= 100 do
    lead = base / 100 |> Kernel.trunc
    new_remainder = rem(base, 100)
    acc = [to_roman(lead, 100) | acc]
    do_numerals(new_remainder, acc)
  end
  def do_numerals(base, acc) when base >= 10 do
    lead = base / 10 |> Kernel.trunc
    new_remainder = rem(base, 10)
    acc = [to_roman(lead, 10) | acc]
    do_numerals(new_remainder, acc)
  end
  def do_numerals(base, acc) when base >= 1 do
    lead = base / 1 |> Kernel.trunc
    new_remainder = rem(base, 1)
    acc = [to_roman(lead, 1) | acc]
    do_numerals(new_remainder, acc)
  end

  def to_roman(1, 1000), do: "M"
  def to_roman(n, 1000), do: to_roman(n-1, 1000) <> "M"
  def to_roman(9, 100), do: "CM"
  def to_roman(5, 100), do: "D"
  def to_roman(4, 100), do: "CD"
  def to_roman(1, 100), do: "C"
  def to_roman(n, 100), do: to_roman(n-1, 100) <> "C"
  def to_roman(9, 10), do: "XC"
  def to_roman(5, 10), do: "L"
  def to_roman(4, 10), do: "XL"
  def to_roman(1, 10), do: "X"
  def to_roman(n, 10), do: to_roman(n-1, 10) <> "X"
  def to_roman(9, 1), do: "IX"
  def to_roman(5, 1), do: "V"
  def to_roman(4, 1), do: "IV"
  def to_roman(1, 1), do: "I"
  def to_roman(n, 1), do: to_roman(n-1, 1) <> "I"
end
