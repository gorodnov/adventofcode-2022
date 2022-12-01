# frozen_string_literal: true

require 'thor'
require './advent_of_code'

module AdventOfCode
  class CLI < Thor
    desc "day [DAY NUMBER]", "Run day solutions"
    def day(number)
      raise 'Must be a number within [1..25]' unless (1..25).include?(number.to_i)
      day = Object.const_get("AdventOfCode::Day#{number}").new AdventOfCode.read_file("./day#{number}/in.txt")
      puts day.solution1.inspect
      puts day.solution2.inspect
    end
  end
end

AdventOfCode::CLI.start(ARGV)



