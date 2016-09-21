defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/[A-Z]|\s[a-z]/, string)
    |> List.flatten
    |> Enum.map(&String.trim/1)
    |> Enum.join()
    |> String.upcase()
  end
end
