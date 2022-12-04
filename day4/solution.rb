# frozen_string_literal: true

module AdventOfCode
  class Day4 < Day
    def solution1
      @input
        .map { |s| s.split(',').map { |ss| ss.split('-').map(&:to_i) }.map { |a| (a[0]..a[1]).to_a } }
        .select { |a|
          overlap = (a[0] & a[1]).length
          overlap == a[0].length || overlap == a[1].length
        }
        .length
    end

    def solution2
      @input
        .map { |s| s.split(',').map { |ss| ss.split('-').map(&:to_i) }.map { |a| (a[0]..a[1]).to_a } }
        .select { |a| (a[0] & a[1]).length > 0 }
        .length
    end
  end
end
