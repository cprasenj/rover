defmodule Plateau do

  defstruct x: nil, y: nil, rovers: []

  defp verifyRover(rover, plateau) do
    cond do
      isPositionEmpty(%Plateau{plateau | rovers: plateau.rovers }, rover.position.coordinate) -> rover
      :else -> raise "collision"
    end
  end

  def command_rover(plateau, rover_id, commands) do
    roverToBeCommand = Enum.find(plateau.rovers, fn r -> r.id == rover_id end)
    updatedRover = Enum.reduce(
      commands,
      roverToBeCommand,
      fn (c, r) ->
        Rover.update(
          r,
          [
            case c do
              "M" -> 1
              _ -> c
            end
          ]
        )
        |> fn (p, r) -> verifyRover(p, r) end.(plateau)
      end
    )

    cond do
      !isPositionEmpty(plateau, updatedRover.position.coordinate) -> raise "collision"
      isInPlateau(plateau, updatedRover) ->
        replaceRover(plateau, roverToBeCommand, updatedRover)
      :else -> raise "Rover out of plateau"
    end

  end

  def addRover(plateau, rover) do
    cond do
      isInPlateau(plateau, rover) && isPositionEmpty(plateau, rover.position.coordinate) ->
        %Plateau{plateau | rovers: [rover | plateau.rovers]}
      :else -> raise "Position already occupied"
    end

  end

  defp isPositionEmpty(plateau, coordinate) do
    Enum.find(plateau.rovers, fn r -> r.position.coordinate == coordinate  end) == nil
  end

  defp replaceRover(plateau, rover, newRover) do
    updatedRoverList = List.delete(plateau.rovers, rover)
    %Plateau{plateau | rovers: [newRover | updatedRoverList]}
  end

  defp isInPlateau(plateau, rover) do
    coordinate = rover.position.coordinate
    coordinate.x <= plateau.x && coordinate.y <= plateau.y
    && coordinate.x >= 0 && coordinate.y >= 0
  end

end

