defmodule MarseRoverTest do
  use ExUnit.Case
  doctest MarseRover

  test "greets the world" do
    assert MarseRover.hello() == :world
  end
end
