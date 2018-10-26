defmodule Hangman.Application do

  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      #worker(Hangman.Server, [])
      {DynamicSupervisor, strategy: :one_for_one, name: Hangman.DynamicSupervisor}
    ]

    options = [
      name: Hangman.Supervisor,
      strategy: :one_for_one,
      # max_restarts: 1,
    ]

    Supervisor.start_link(children, options)

  end
end

