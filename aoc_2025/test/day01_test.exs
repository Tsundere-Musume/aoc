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

  test "part 2 example" do
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

    assert Day01.part2(input) == 6
  end

  test "cyclical rotations" do
    input = """
    L50
    R1000
    """

    assert Day01.part2(input) == 11
  end
end
