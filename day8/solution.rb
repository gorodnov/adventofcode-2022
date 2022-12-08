# frozen_string_literal: true

require 'matrix'

module AdventOfCode
  class Day8 < Day
    def solution1
      Matrix[ *input.map { |s| s.split('').map(&:to_i) } ]
        .then(&method(:find_around_trees))
        .keep_if { |_, v|
          v[:edge] ||
            v[:top].max < v[:t] ||
            v[:right].max < v[:t] ||
            v[:bottom].max < v[:t] ||
            v[:left].max < v[:t]
        }
        .length
    end

    def solution2
      Matrix[ *input.map { |s| s.split('').map(&:to_i) } ]
        .then(&method(:find_around_trees))
        .keep_if { |_, v| !v[:edge] }
        .map { |_, v| score(v[:t], v[:top]) * score(v[:t], v[:right]) * score(v[:t], v[:bottom]) * score(v[:t], v[:left]) }
        .max
    end

    private

    def score(current, trees)
      scr = trees.index { |i| i >= current }
      scr.nil? ? trees.length : scr + 1
    end

    def find_around_trees(forest)
      xsize = forest.row(0).size - 1
      ysize = forest.column(0).size - 1
      trees = {}
      for x in 0..xsize do
        for y in 0..ysize do
          row = forest.row(x)
          column = forest.column(y)
          trees[[x, y]] = {
            t: forest[x, y],
            left: y > 0 ? row[0...y].reverse : [0],
            right: y < ysize ? row[y + 1..-1] : [0],
            top: x > 0 ? column[0...x].reverse : [0],
            bottom: x < xsize ? column[x + 1..-1]: [0],
            edge: x == 0 || y == 0 || x == xsize || y == ysize
          }
        end
      end
      trees
    end
  end
end

