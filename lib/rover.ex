defmodule Rover do

  defstruct position: Position,
            commands_remaining: [],
            commands_executed: [],
            error: nil

  def new(position, commands \\ []) do
    %{position: position, commands_remaining: commands}
  end

  def new(x, y, direction, commands \\ []) do
    new(%Position{x: x, y: y, direction: direction}, commands)
  end

end

