defmodule Rover do

  defstruct position: Position

  def update(rover, commands \\ []) do
    Enum.reduce commands, rover, fn (c, r) ->
      %Rover{
        position: Position.apply_command(r.position, c)
      }
    end
  end
end

