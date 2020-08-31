defmodule Plateau do

  defstruct x: nil, y: nil, rovers: []

  def command_rover(plateau, rover_id, commands) do
    roverToBeCommand = Enum.find(plateau.rovers, fn r -> r == rover_id end)
    updatedRover = Rover.update(roverToBeCommand, commands)
    cond do
      isInPlateau(plateau, updatedRover) ->
        replaceRover(plateau, roverToBeCommand, updatedRover)
      :else -> raise "Rover out of plateau"
    end

  end

  def addRover(plateau, rover, updatedRover) do
    cond do
      isInPlateau(plateau, updatedRover) && isPositionEmpty(plateau, rover.position.coordinate)->
        replaceRover(plateau, rover, updatedRover)
      :else -> raise "Position already occupied"
    end

  end

  defp isPositionEmpty(plateau, coordinate) do
    Enum.find(plateau.rovers, fn r -> r.position.coordinate != coordinate  end) != nil
  end

  defp replaceRover(plateau, rover, newRover) do
    updatedRoverList = List.delete(plateau.rovers, rover)
    %Plateau{ plateau | rovers: [newRover | updatedRoverList] }
  end

  defp isInPlateau(plateau, rover) do
    coordinate = rover.position.coordinate
    coordinate.x <= plateau.x && coordinate.y <= plateau.y
  end

end

