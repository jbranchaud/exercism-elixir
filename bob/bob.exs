defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) -> "Fine. Be that way!"
      questioning?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
        # true -> raise "Your implementation goes here"
    end
  end

  defp shouting?(input) do
    String.downcase(input) != input && String.upcase(input) == input
  end

  defp questioning?(input) do
    String.ends_with?(input, "?")
  end

  defp silent?(input) do
    String.trim(input) == ""
  end
end
