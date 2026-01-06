defmodule AOC.Day02 do
  @moduledoc """
  Advent of Code Day 02 template.
  """
  require Integer

  # Reads the input file for this day
  def read_input do
    File.read!("inputs/day02.txt")
  end

  defp parse_range(range) do
    String.split(range, "-")
    |> Enum.map(&String.to_integer/1)
  end

  defp invalid_id?(id) do
    id_str = Integer.to_string(id)
    n = String.length(id_str)
    rem(n, 2) == 0 and match?({half, half}, String.split_at(id_str, div(n, 2)))
  end

  defp invalid_id_2?(id) do
    id_str = Integer.to_string(id)
    n = String.length(id_str)

    n > 1 and
      1..div(n, 2)
      |> Enum.any?(fn try_legnth ->
        rem(n, try_legnth) == 0 and
          (
            pattern = String.slice(id_str, 0, try_legnth)
            id_str == String.duplicate(pattern, div(n, try_legnth))
          )
      end)
  end

  # Parses raw input into a data structure
  def parse(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&String.trim/1)
  end

  defp invalid_ids_in_range(range_str) do
    [start_range, end_range] = parse_range(range_str)

    start_range..end_range
    |> Enum.filter(&invalid_id?/1)
  end

  defp invalid_ids_in_range_2(range_str) do
    [start_range, end_range] = parse_range(range_str)

    start_range..end_range
    |> Enum.filter(&invalid_id_2?/1)
  end

  # Part 1 solution
  def part1(input) do
    input
    |> parse()
    |> Enum.flat_map(&invalid_ids_in_range/1)
    |> Enum.sum()
  end

  # Part 2 solution
  def part2(input) do
    input
    |> parse()
    |> Enum.flat_map(&invalid_ids_in_range_2/1)
    |> Enum.sum()
  end
end
