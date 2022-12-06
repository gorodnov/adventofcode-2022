# frozen_string_literal: true

module AdventOfCode
  class Day2 < Day
    ROCK = 'Rock', PAPER = 'Paper', SCISSORS = 'Scissors'

    CONVERSION = {
      'A' => ROCK,
      'B' => PAPER,
      'C' => SCISSORS
    }.freeze

    WIN = {
      ROCK => SCISSORS,
      PAPER => ROCK,
      SCISSORS => PAPER
    }.freeze

    LOSS = {
      ROCK => PAPER,
      PAPER => SCISSORS,
      SCISSORS => ROCK
    }.freeze

    SCORING = {
      ROCK => 1, PAPER => 2, SCISSORS => 3
    }.freeze

    def solution1
      input
        .map { |s| s.split(' ') }
        .map { |pair|
          [CONVERSION[pair[0]], { 'X' => ROCK, 'Y' => PAPER, 'Z' => SCISSORS }.freeze[pair[1]]]
        }
        .map(&method(:calc))
        .sum
    end

    def solution2
      input
        .map { |s| s.split(' ') }
        .map { |pair|
          v = CONVERSION[pair[0]]
          [v, { 'X' => WIN[v], 'Y' => v, 'Z' => LOSS[v] }[pair[1]]]
        }
        .map(&method(:calc))
        .sum
    end

    private

    def calc(pair)
      round = if WIN[pair[1]] == pair[0]
                6
              elsif LOSS[pair[1]] == pair[0]
                0
              else
                3
              end
      round + SCORING[pair[1]]
    end
  end
end
