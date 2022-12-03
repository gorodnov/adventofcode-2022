# frozen_string_literal: true

module AdventOfCode
  class Day3 < Day
    ITEMS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    def solution1
      @input
        .map { |s| s.split('') }
        .map { |a| [a[0, a.length/2], a[a.length/2..-1]] }
        .map { |compartments| compartments[0] & compartments[1] }
        .flatten
        .map(&method(:priority))
        .sum
    end

    def solution2
      @input
        .map { |s| s.split('') }
        .each_slice(3)
        .map { |a| a[0] & a[1] & a[2] }
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
