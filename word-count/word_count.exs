defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/(*UTF8)[^\w\s-]/, "") # remove non-word characters except hyphens
    |> String.replace(~r/[_]/, " ") # separate underscored words
    |> String.downcase() # unify casing to lowercase
    |> String.split() # split to word list on whitespace
    |> Enum.reduce(%{}, fn(word, acc) ->
      {_, acc} = Map.get_and_update(acc, word, fn(count) ->
        {count, (count || 0) + 1}
      end)
      acc
    end)
  end
end
