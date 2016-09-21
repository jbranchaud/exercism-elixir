defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(is_anagram?(base, &1)))
  end

  def is_anagram?([], []), do: true
  def is_anagram?(base, base) when is_binary(base), do: false
  def is_anagram?(base, word) when length(base) != length(word), do: false
  def is_anagram?(base, word) when is_binary(base) and is_binary(word) do
    {a, b} = {word_to_list(base), word_to_list(word)}
    a != b && is_anagram?(word_to_list(base), word_to_list(word))
  end
  def is_anagram?(base_letters, [head | tail]) do
    remaining_letters = List.delete(base_letters, head)
    is_anagram?(remaining_letters, tail)
  end

  defp word_to_list(word) do
    word
    |> String.downcase
    |> String.split("", trim: true)
  end
end
