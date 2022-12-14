# frozen_string_literal: true

require './core'

module AdventOfCode
  class Day
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def solution1; end
    def solution2; end
  end
end

require './day1/solution'
require './day2/solution'
require './day3/solution'
require './day4/solution'
require './day5/solution'
require './day6/solution'
require './day7/solution'
require './day8/solution'
require './day9/solution'

