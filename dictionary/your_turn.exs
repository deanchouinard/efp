# Your Turn
str = "had we but world enough, and time"

IO.inspect String.split(str, ",")
IO.inspect String.graphemes(str)
IO.inspect String.graphemes(str)
|> Enum.map(fn(x) -> <<xx::utf8>> = x ; xx end)
#|> Enum.map(fn(x) -> :binary.decode_unsigned(x) end)
String.graphemes(str)
|> Enum.map(fn(x) -> <<xx::utf8>> = x ; xx end)
