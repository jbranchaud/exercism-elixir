defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "zero is invalid"
  def nth(count), do: do_nth(count, 1)

  defp do_nth(0, curr_val), do: curr_val
  defp do_nth(count, curr_val) do
    new_val = curr_val + 1
    case is_prime?(new_val) do
      true ->
        new_count = count - 1
        do_nth(new_count, new_val)
      false ->
        do_nth(count, new_val)
    end
  end

  defp is_prime?(2), do: true
  defp is_prime?(number) do
    last = midpoint(number)
    Enum.all?(2..last, &(not_divisor?(&1, number)))
  end

  defp not_divisor?(divisor, number), do: rem(number, divisor) != 0

  defp midpoint(number) do
    number / 2 |> Float.ceil |> Kernel.round
  end
end
