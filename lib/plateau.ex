defmodule Plateau do

#  @behaviour Access
#  def fetch(term, key), do: Map.fetch(term, key)

  @default_size {10, 10}
  defstruct size: @default_size, rovers: %{}

end

#defImpl operations,  for: Plateau do
#
#  def deploy_rover(_plateau, x, y) do
#
#  end
#
#end