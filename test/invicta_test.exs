defmodule InvictaTest do
  use ExUnit.Case
  doctest Invicta

  test "greets the world" do
    assert Invicta.hello() == :world
  end
end
