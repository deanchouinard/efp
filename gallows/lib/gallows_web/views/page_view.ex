defmodule GallowsWeb.PageView do
  use GallowsWeb, :view

  def plural_of(word, 1), do: "1 " <> word
  def plural_of(word, n) when n < 0,
    do: {:safe, "<span style='color: red'>" <> "#{n} " <> word <> "s" <> "</span>"}
  def plural_of(word, n), do: "#{n} " <> word <> "s"

  def amount(val) do
      "<span style='color: blue'>#{val}</span>"
  end

end
