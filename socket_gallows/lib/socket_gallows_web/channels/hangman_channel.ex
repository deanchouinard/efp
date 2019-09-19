defimpl Jason.Encoder, for: [MapSet, Range, Stream] do
  def encode(struct, opts) do
    Jason.Encode.list(Enum.to_list(struct), opts)
  end
end

defmodule SocketGallowsWeb.HangmanChannel do
  require Logger
  use Phoenix.Channel

  def join("hangman:game", _, socket) do
    game = Hangman.new_game()
    socket = assign(socket, :game, game)
    { :ok, socket }
  end

  def handle_in("tally", _, socket) do
    game = socket.assigns.game
    tally = Hangman.tally(game)
    IO.inspect tally, label: "tally"
    IO.inspect socket, label: "socket"
    push(socket, "tally", tally)
    {:noreply, socket}
  end

  def handle_in(_, _, socket) do
    Logger.error("bad message")
    {:noreply, socket}
  end

end

