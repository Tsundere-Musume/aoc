defmodule AOC.Day02 do
  @moduledoc """
  Advent of Code Day 02 template.
  """
  require Integer

  # Reads the input file for this day
  def read_input do
    File.read!("inputs/day02.txt")
  end

  def parse_range(range) do
    String.split(range, "-")
    |> Enum.map(&String.to_integer/1)
  end

  # Parses raw input into a data structure
  def parse(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&String.trim/1)
  end

  # Part 1 solution
  def part1(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn range, accum ->
      [start_range, end_range] = parse_range(range)

      curr =
        start_range..end_range
        |> Enum.filter(fn num ->
          num_str = Integer.to_string(num)
          n = String.length(num_str)

          if rem(n, 2) == 0 do
            {a, b} = String.split_at(num_str, div(n, 2))
            a == b
          else
            false
          end
        end)
        |> Enum.sum()

      accum + curr
    end)
  end

  # Part 2 solution
  def part2(input) do
    input
    |> parse()
  end
end
