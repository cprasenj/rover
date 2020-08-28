defmodule Position do
  defstruct x: nil, y: nil, direction: nil

  defp new(one, direction) do %__MODULE__{one | direction: direction} end

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

  defp move(position, unit) do
    case position.direction do
      "N" -> %__MODULE__{position | y: position.y + unit}
      "S" -> %__MODULE__{position | y: position.y - unit}
      "E" -> %__MODULE__{position | x: position.x + unit}
      "W" -> %__MODULE__{position | x: position.x - unit}
      _  -> position
    end
  end

  def apply_command(position, option) when is_integer(option), do: move(position, option)
  def apply_command(position, option) when is_binary(option), do: turn(position, option)

end

