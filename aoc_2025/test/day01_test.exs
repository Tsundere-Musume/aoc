defmodule AOC.Day01Test do
  use ExUnit.Case

  alias AOC.Day01

  test "part 1 example" do
    input = """
            L68
            L30
            R48
            L5
            R60
            L55
            L1
            L99
            R14
            L82
    """
    assert Day01.part1(input) == 3
  end
end
