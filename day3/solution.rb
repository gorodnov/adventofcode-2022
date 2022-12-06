# frozen_string_literal: true

module AdventOfCode
  class Day3 < Day
    ITEMS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    def solution1
      input
        .map { |s| s.split('').each_slice(s.length/2) }
        .map { |a| a.reduce(&:&) }
        .flatten
        .map(&method(:priority))
        .sum
    end

    def solution2
      input
        .map { |s| s.split('') }
        .each_slice(3)
        .map { |a| a.reduce(&:&) }
        .flatten
        .map(&method(:priority))
        .sum
    end

    private


    def priority(item)
      ITEMS.index(item) + 1
    end
  end
end
