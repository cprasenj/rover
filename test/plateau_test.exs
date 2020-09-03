defmodule PlateauTest do
  use ExUnit.Case
  doctest Plateau

  test "should add rover in empty plateau" do
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

  test "should add rover plateau with existing rovers" do
    plateau = %Plateau{
      x: 5,
      y: 5,
      rovers: [%Rover{
        id: "1",
        position: %Position{
          coordinate: %Coordinate{
            x: 0,
            y: 0
          },
          direction: "N"
        }
      }]
    }

    assert Plateau.addRover(
             plateau,
             %Rover{
               id: "2",
               position: %Position{
                 coordinate: %Coordinate{
                   x: 1,
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
                 id: "2",
                 position: %Position{
                   coordinate: %Coordinate{
                     x: 1,
                     y: 0
                   },
                   direction: "N"
                 }
               },
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

  test "should command a rover in plateau" do
    plateau = %Plateau{x: 5, y: 5, rovers: []}
    newPlateau = Plateau.addRover(
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

    anotherPlateau = Plateau.addRover(
      newPlateau,
      %Rover{
        id: "2",
        position: %Position{
          coordinate: %Coordinate{
            x: 1,
            y: 0
          },
          direction: "E"
        }
      }
    )

    assert Plateau.command_rover(anotherPlateau, "2", ["L", "M", "M"]) == %Plateau {
             x: 5,
             y: 5,
             rovers: [
               %Rover{
                 id: "2",
                 position: %Position{
                   coordinate: %Coordinate{
                     x: 1,
                     y: 2
                   },
                   direction: "N"
                 }
               },
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
end