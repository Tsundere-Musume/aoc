defmodule Mix.Tasks.Aoc.Gen do
  use Mix.Task

  @shortdoc "Generates Advent of Code day template"

  @moduledoc """
  Generates files for a given Advent of Code day.

  Usage:
      mix aoc.gen 1
      mix aoc.gen 05
  """

  def run(args) do
    Mix.Task.run("app.start")

    day =
      case args do
        [d] -> d |> String.pad_leading(2, "0")
        _ -> Mix.raise("Usage: mix aoc.gen <day>")
      end

    module_name = "Day#{day}"

    lib_path = "lib/aoc/day#{day}.ex"
    input_path = "inputs/day#{day}.txt"
    test_path = "test/day#{day}_test.exs"

    File.mkdir_p!("lib/aoc")
    File.mkdir_p!("inputs")
    File.mkdir_p!("test")

    write_file(lib_path, day_module(module_name, day))
    write_file(input_path, "")
    write_file(test_path, test_module(module_name))

    Mix.shell().info("✅ Generated files for Day #{day}")
    Mix.shell().info("  • #{lib_path}")
    Mix.shell().info("  • #{input_path}")
    Mix.shell().info("  • #{test_path}")
  end

  defp write_file(path, contents) do
    if File.exists?(path) do
      Mix.shell().error("⚠️  Skipped #{path} (already exists)")
    else
      File.write!(path, contents)
    end
  end

  defp day_module(module_name, day) do
    """
    defmodule AOC.#{module_name} do
      @moduledoc \"\"\"
      Advent of Code Day #{day} template.
      \"\"\"

      # Reads the input file for this day
      def read_input do
        File.read!("inputs/day#{day}.txt")
      end

      # Parses raw input into a data structure
      def parse(input) do
        input
        |> String.split("\\n", trim: true)
      end

      # Part 1 solution
      def part1(input) do
        input
        |> parse()
      end

      # Part 2 solution
      def part2(input) do
        input
        |> parse()
      end
    end
    """
  end

  defp test_module(module_name) do
    """
    defmodule AOC.#{module_name}Test do
      use ExUnit.Case

      alias AOC.#{module_name}

      test "part 1 example" do
        input = ""
        assert #{module_name}.part1(input) == nil
      end

      test "part 2 example" do
        input = ""
        assert #{module_name}.part2(input) == nil
      end
    end
    """
  end
end
