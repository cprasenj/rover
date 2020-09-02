defmodule PlateauTest do
  use ExUnit.Case
  doctest Plateau

  test "should add rover in plateau" do
    plateau = %Plateau{x: 5, y: 5, rovers: []}

    assert Plateau.addRover(
             plateau,
             %Rover{
               id: "1",
               position: %Position{
                 coordinate: %Coordinate{
                   x: 0,
                   y: 0
                 },
                 direction: "N"
               }
             }
           ) == %Plateau{
             x: 5,
             y: 5,
             rovers: [
               %Rover{
                 id: "1",
                 position: %Position{
                   coordinate: %Coordinate{
                     x: 0,
                     y: 0
                   },
                   direction: "N"
                 }
               }
             ]
           }

  end

  test "should not add rover in plateau" do
    plateau = %Plateau{
      x: 5,
      y: 5,
      rovers: [
        %Rover{
          id: "1",
          position: %Position{
            coordinate: %Coordinate{
              x: 0,
              y: 0
            },
            direction: "N"
          }
        }
      ]
    }

    assert_raise RuntimeError, "Position already occupied",
                 fn -> Plateau.addRover(
                         plateau,
                         %Rover{
                           id: "1",
                           position: %Position{
                             coordinate: %Coordinate{
                               x: 0,
                               y: 0
                             },
                             direction: "N"
                           }
                         }
                       )
                 end
  end
end