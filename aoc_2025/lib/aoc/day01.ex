defmodule AOC.Day01 do
  @moduledoc """
  Advent of Code Day 01 template.
  """

  # Reads the input file for this day
  def read_input do
    File.read!("inputs/day01.txt")
  end

  # Parses raw input into a data structure
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end

  # Part 1 solution
  def part1(input) do
    {_, count} =
      input
      |> parse()
      |> Enum.reduce({50, 0}, fn line, {current, count} ->
        <<dir::binary-size(1), rest::binary>> = line
        rotation = String.to_integer(rest)

        current =
          case dir do
            "L" -> current + rotation
            "R" -> current - rotation
          end
          |> Integer.mod(100)

        count =
          case current do
            0 -> count + 1
            _ -> count
          end

        {current, count}
      end)

    count
  end

  # Part 2 solution
  def part2(input) do
    input
    |> parse()
  end
end
