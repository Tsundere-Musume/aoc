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
    assert Day03.part2(input) == 3_121_910_778_619
  end

  test "max_jolts_in_order" do
    test = "987654321111111"
    assert Day03.max_jolts_in_order(test) == [{9, 0}]
    assert Day03.max_jolts_in_order("811111111111119") == [{9, 14}, {8, 0}]
    assert Day03.max_jolts_in_order("811111111111119", 1) == [{9, 14}, {1, 1}]
  end

  test "get_joltage_2" do
    assert Day03.get_joltage_2("987654321111111") == 987654321111
    assert Day03.get_joltage_2("811111111111119") == 811111111119
    assert Day03.get_joltage_2("234234234234278") == 434234234278
    assert Day03.get_joltage_2("818181911112111") == 888911112111
  end
end
