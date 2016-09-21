defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.trim
    |> String.upcase
    |> String.split("", trim: true)
    |> do_score
  end

  def do_score([]), do: 0
  def do_score([head | tail]), do: do_letter_score(head) + do_score(tail)
  def do_letter_score(letter)
    when letter in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], do: 1
  def do_letter_score(letter)
    when letter in ["D", "G"], do: 2
  def do_letter_score(letter)
    when letter in ["B", "C", "M", "P"], do: 3
  def do_letter_score(letter)
    when letter in ["F", "H", "V", "W", "Y"], do: 4
  def do_letter_score(letter)
    when letter in ["K"], do: 5
  def do_letter_score(letter)
    when letter in ["J", "X"], do: 8
  def do_letter_score(letter)
    when letter in ["Q", "Z"], do: 10
end
