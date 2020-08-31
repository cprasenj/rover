defmodule RoverTest do
  use ExUnit.Case
  doctest Rover

  test "should change direction of rover" do
    assert %Rover{
             position: %Position{
               coordinate:
               %Coordinate{
                 x: 0,
                 y: 0
               },
               direction: "E"
             }
           } ==
             Rover.update(
               %Rover{
                 position: %Position{
                   coordinate: %Coordinate{
                     x: 0,
                     y: 0
                   },
                   direction: "N"
                 }
               },
               ["R"]
             )
  end

  test "should change position of rover" do
    assert %Rover{
             position: %Position{
               coordinate: %Coordinate{
                 x: 0,
                 y: 1
               },
               direction: "W"
             }
           } ==
             Rover.update(
               %Rover{
                 position: %Position{
                   coordinate: %Coordinate{
                     x: 0,
                     y: 0
                   },
                   direction: "N"
                 }
               },
               [1, "L"]
             )
  end

end