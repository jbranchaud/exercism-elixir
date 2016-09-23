defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(1) do
    """
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  def verse(2 = number) do
    bottles_before = inflect_bottles(number - 1)
    bottles_after = inflect_bottles(number - 2)
    """
#{bottles_before} of beer on the wall, #{bottles_before} of beer.
Take it down and pass it around, #{bottles_after} of beer on the wall.
    """
  end
  def verse(number) do
    bottles_before = inflect_bottles(number - 1)
    bottles_after = inflect_bottles(number - 2)
    """
#{bottles_before} of beer on the wall, #{bottles_before} of beer.
Take one down and pass it around, #{bottles_after} of beer on the wall.
    """
  end

  defp inflect_bottles(0), do: "no more bottles"
  defp inflect_bottles(1), do: "1 bottle"
  defp inflect_bottles(n), do: "#{n} bottles"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    Enum.map(range, &verse/1)
    |> Enum.join("\n")
  end
end
