# frozen_string_literal: true

module AdventOfCode
  class Day1 < Day
    def solution1
      @input
        .map(&:to_i)
        .chunk_and_map { |i| i > 0 }
        .map(&:sum)
        .max
    end

    def solution2
      @input
        .map(&:to_i)
        .chunk_and_map { |i| i > 0 }
        .map(&:sum)
        .sort.last(3)
        .sum
    end
  end
end
