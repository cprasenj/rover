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

  def addRover(plateau, rover) do
    cond do
      isInPlateau(plateau, rover) && isPositionEmpty(plateau, rover) ->
        %Plateau{plateau | rovers: [rover | plateau.rovers]}
      :else -> raise "Position already occupied"
    end

  end

  defp isPositionEmpty(plateau, rover) do
    coordinate = rover.position.coordinate
    Enum.find(plateau.rovers, fn r -> r.position.coordinate == coordinate  end) == nil
  end

  defp replaceRover(plateau, rover, newRover) do
    updatedRoverList = List.delete(plateau.rovers, rover)
    %Plateau{ plateau | rovers: [newRover | updatedRoverList] }
  end

  defp isInPlateau(plateau, rover) do
    coordinate = rover.position.coordinate
    coordinate.x <= plateau.x && coordinate.y <= plateau.y
    && coordinate.x >= 0 && coordinate.y >= 0
  end

end

