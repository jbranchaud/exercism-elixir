defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    Enum.map([3,5,7], fn(x) -> do_convert(number, x) end)
    |> Enum.join
    |> coalesce(Integer.to_string(number))
  end

  defp coalesce("", fallback), do: fallback
  defp coalesce(nil, fallback), do: fallback
  defp coalesce(string, _fallback), do: string

  defp do_convert(number, 3) when rem(number, 3) == 0, do: "Pling"
  defp do_convert(number, 5) when rem(number, 5) == 0, do: "Plang"
  defp do_convert(number, 7) when rem(number, 7) == 0, do: "Plong"
  defp do_convert(number, _), do: ""
end
