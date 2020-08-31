defmodule Position do
  defstruct [:coordinate, :direction]

  defp new(one, direction) do
    %__MODULE__{one | direction: direction} end

  defp turn(position, "R") do
    case position.direction do
      "N" -> new(position, "E")
      "S" -> new(position, "W")
      "E" -> new(position, "S")
      "W" -> new(position, "N")
      _ -> position
    end
  end

  defp turn(position, "L") do
    case position.direction do
      "N" -> new(position, "W")
      "S" -> new(position, "E")
      "E" -> new(position, "N")
      "W" -> new(position, "S")
      _ -> position
    end
  end

  defp turn(position, _) do
    position
  end

  defp move(position, unit) do
    times = Enum.to_list(0..unit-1)
    case position.direction do
      "N" ->
        %__MODULE__{
          position |
          coordinate: Enum.reduce(times, position.coordinate, fn (n, c) -> Coordinate.moveNorth(c) end)
        }
      "S" ->
        %__MODULE__{
          position |
          coordinate: Enum.reduce(times, position.coordinate, fn (n, c) -> Coordinate.moveSouth(c) end)
        }
      "E" ->
        %__MODULE__{
          position |
          coordinate: Enum.reduce(times, position.coordinate, fn (n, c) -> Coordinate.moveEast(c) end)
        }
      "W" ->
        %__MODULE__{
          position |
          coordinate: Enum.reduce(times, position.coordinate, fn (n, c) -> Coordinate.moveWest(c) end)
        }
      _ ->
        position
    end
  end

  def apply_command(position, option) when is_integer(option), do: move(position, option)
  def apply_command(position, option) when is_binary(option), do: turn(position, option)

end

