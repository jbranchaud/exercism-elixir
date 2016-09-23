defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    parts =
      sentence
      |> String.downcase
      |> String.replace(~r/[^\w]/u, "")
      |> String.split("", trim: true)

    parts == Enum.uniq(parts)
  end
end
