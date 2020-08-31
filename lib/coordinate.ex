defmodule Coordinate do
  defstruct [:x, :y]

  def moveEast(coordinate) do
    %Coordinate { coordinate | x: coordinate.x + 1 }
  end

  def moveWest(coordinate) do
    %Coordinate { coordinate | x: coordinate.x - 1 }
  end

  def moveNorth(coordinate) do
    %Coordinate { coordinate | y: coordinate.y + 1 }
  end

  def moveSouth(coordinate) do
    %Coordinate { coordinate | y: coordinate.y - 1 }
  end
end