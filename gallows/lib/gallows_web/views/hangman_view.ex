defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  def word_so_far(letters), do: letters |> Enum.join(" ")

end
