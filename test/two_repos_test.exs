defmodule TwoReposTest do
  use ExUnit.Case
  doctest TwoRepos

  test "greets the world" do
    assert TwoRepos.hello() == :world
  end
end
