defmodule Rover do

  defstruct [:id, position: Position]

  def update(rover, commands \\ []) do
    Enum.reduce commands, rover, fn (c, r) ->
      %Rover{ rover |
        position: Position.apply_command(r.position, c)
      }
    end
  end
end

