defmodule AOC.Day03 do
  @moduledoc """
  Advent of Code Day 03 template.
  """

  # Reads the input file for this day
  def read_input do
    File.read!("inputs/day03.txt")
  end

  # Parses raw input into a data structure
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end

  def max_jolts_in_order(bank, start_idx) do
    String.graphemes(bank)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()
    |> Enum.filter(fn {_, idx} -> idx >= start_idx end)
    |> Enum.reduce([], fn {num, idx}, stack ->
      case stack do
        [] -> [{num, idx}]
        [{top_num, _top_idx} | _tail] -> if num > top_num, do: [{num, idx} | stack], else: stack
      end
    end)
  end

  def max_jolts_in_order(bank) do
    max_jolts_in_order(bank, 0)
  end

  # Part 1 solution
  def part1(input) do
    input
    |> parse()
    |> Enum.map(fn bank ->
      first_jolts = max_jolts_in_order(bank)
      bank_length = String.length(bank)

      case first_jolts do
        [{num, idx} | _] when idx < bank_length - 1 ->
          [ {n, _idx}| _tail] = max_jolts_in_order(bank, idx + 1)
          num * 10 + n

        [{first, _}, {second, _} | _rest] ->
          second * 10 + first
      end
    end)
    |> Enum.sum()
  end

  # Part 2 solution
  def part2(input) do
    input
    |> parse()
  end
end
