defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> do_encode(nil, 0 , "")
  end

  defp do_encode([], nil, 0, ""), do: ""
  defp do_encode([], curr_char, count, encoding) do
    update_encoding(encoding, count, curr_char)
  end
  defp do_encode([head | tail], nil, 0, "") do
    do_encode(tail, head, 1, "")
  end
  defp do_encode([head | tail], curr_char, count, encoding) do
    case head != curr_char do
      true ->
        encoding = update_encoding(encoding, count, curr_char)
        do_encode(tail, head, 1, encoding)
      _ -> do_encode(tail, head, count + 1, encoding)
    end
  end

  defp update_encoding(encoding, count, char) do
    encoding <> Integer.to_string(count) <> char
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/\d+\w/, string)
    |> List.flatten
    |> Enum.map(&expand_chars/1)
    |> Enum.join("")
  end

  defp expand_chars(num, char) when is_number(num) do
    Enum.map(1..num, fn(_) -> char end)
    |> Enum.join("")
  end
  defp expand_chars(num, char) when is_binary(num) do
    num
    |> String.to_integer
    |> expand_chars(char)
  end
  defp expand_chars(num_char) do
    %{"num" => num, "char" => char} =
      Regex.named_captures(~r/(?<num>\d+)(?<char>\w)/, num_char)
    expand_chars(num, char)
  end
end
