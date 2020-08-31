defmodule PositionTest do
  use ExUnit.Case
  doctest Position

  test "should turn right from the current position" do
    assert %Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "E"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "N"}, "R")
    assert %Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "S"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "E"}, "R")
    assert %Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "W"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "S"}, "R")
  end

  test "should turn left from the current position" do
    assert %Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "W"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "N"}, "L")
    assert %Position{coordinate: %Coordinate {x: 0, y: 0}, direction: "S"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "W"}, "L")
    assert %Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "E"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "S"}, "L")

  end

  test "should move towards north" do
    assert %Position{coordinate: %Coordinate{x: 0, y: 1}, direction: "N"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "N"}, 1)
  end

  test "should move towards south" do
    assert %Position{coordinate: %Coordinate{x: 0, y: -1}, direction: "S"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 0, y: 0}, direction: "S"}, 1)
  end

  test "should move towards east" do
    assert %Position{coordinate: %Coordinate{x: 13, y: -9}, direction: "E"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 8, y: -9}, direction: "E"}, 5)
  end

  test "should move towards west" do
    assert %Position{coordinate: %Coordinate{x: 3, y: -9}, direction: "W"} ==
             Position.apply_command(%Position{coordinate: %Coordinate{x: 8, y: -9}, direction: "W"}, 5)
  end

end
