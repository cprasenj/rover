#defmodule User do
#  @behaviour Access
#  defstruct name: "Prasenjit", age: 10
#
#  def fetch(term, key), do: Map.fetch(term, key)
#
#  def new(name, age) do
#    %__MODULE__{name: name, age: age}
#  end
#
#  def new() do
#    %__MODULE__{}
#  end
#
#end
#
#defprotocol Opts do
#  def get(user, key)
#  def update(user, age)
#end
#
#defimpl Opts, for: User do
#
#  def get(user, field) do
#    user[field]
#  end
#
#  def update(user, age) do
#    %{user | age: age}
#  end
#end
#
#user = User.new
#
#IO.puts Opts.get(user, :age)
#newUser = Opts.update(user, 12)
#IO.puts Opts.get(newUser, :age)