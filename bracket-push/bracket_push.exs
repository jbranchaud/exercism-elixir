defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> sanatize_string
    |> String.codepoints
    |> do_check_brackets([])
  end

  # everything opened was closed
  def do_check_brackets([], []), do: true

  # everything opened was not closed
  def do_check_brackets([], _stack), do: false

  # found a close for an open
  def do_check_brackets(["}" | input_tail], ["{" | stack_tail]) do
    do_check_brackets(input_tail, stack_tail)
  end
  def do_check_brackets([")" | input_tail], ["(" | stack_tail]) do
    do_check_brackets(input_tail, stack_tail)
  end
  def do_check_brackets(["]" | input_tail], ["[" | stack_tail]) do
    do_check_brackets(input_tail, stack_tail)
  end

  # found a new open
  def do_check_brackets([head | input_tail], stack) do
    new_stack = [head | stack]
    do_check_brackets(input_tail, new_stack)
  end

  defp sanatize_string(str) do
    String.replace(str, ~r/[^\{\}\[\]\(\)]/, "")
  end
end
