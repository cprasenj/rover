defmodule CoordinateTest do
  use ExUnit.Case
  doctest Coordinate

  test "should move north" do
    assert %Coordinate{x: 0, y: 1} ==
             Coordinate.moveNorth(%Coordinate{x: 0, y: 0})

    assert %Coordinate{x: 0, y: 2} ==
             Coordinate.moveNorth(%Coordinate{x: 0, y: 1})

    assert %Coordinate{x: 0, y: 0} ==
             Coordinate.moveNorth(%Coordinate{x: 0, y: -1})

  end

  test "should move south" do
    assert %Coordinate{x: 0, y: -1} ==
             Coordinate.moveSouth(%Coordinate{x: 0, y: 0})

    assert %Coordinate{x: 0, y: 0} ==
             Coordinate.moveSouth(%Coordinate{x: 0, y: 1})

    assert %Coordinate{x: 0, y: 2} ==
             Coordinate.moveSouth(%Coordinate{x: 0, y: 3})

  end

  test "should move east" do
    assert %Coordinate{x: 0, y: -1} ==
             Coordinate.moveEast(%Coordinate{x: -1, y: -1})

    assert %Coordinate{x: 0, y: 0} ==
             Coordinate.moveEast(%Coordinate{x: -1, y: 0})

    assert %Coordinate{x: 0, y: 2} ==
             Coordinate.moveEast(%Coordinate{x: -1, y: 2})

  end

  test "should move west" do
    assert %Coordinate{x: -2, y: -1} ==
             Coordinate.moveWest(%Coordinate{x: -1, y: -1})

    assert %Coordinate{x: -2, y: 0} ==
             Coordinate.moveWest(%Coordinate{x: -1, y: 0})

    assert %Coordinate{x: 0, y: 2} ==
             Coordinate.moveWest(%Coordinate{x: 1, y: 2})

  end

end