defmodule Invicta do
  @moduledoc """
  Documentation for `Invicta`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Invicta.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Invicta.Map do
  defstruct [:starsystems] 
end

defmodule Invicta.StarSystem do
  defstruct [:id, :connections] 
end
