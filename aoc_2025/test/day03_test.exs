defmodule AOC.Day03Test do
  use ExUnit.Case

  alias AOC.Day03

  test "part 1 example" do
    input = "987654321111111
             811111111111119
             234234234234278
             818181911112111"
    assert Day03.part1(input) == 357
  end

  test "part 2 example" do
    input = "987654321111111
             811111111111119
             234234234234278
             818181911112111"
    assert Day03.part2(input) == nil
  end

  test "max_jolts_in_order" do
    test = "987654321111111"
    assert Day03.max_jolts_in_order(test) == [{9,0}]
    assert Day03.max_jolts_in_order("811111111111119") == [ {9, 14}, {8,0}]
    assert Day03.max_jolts_in_order("811111111111119", 1) == [ {9, 14}, {1,1}]
  end
end
