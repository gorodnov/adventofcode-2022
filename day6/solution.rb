# frozen_string_literal: true

module AdventOfCode
  class Day6 < Day
    def solution1
      traverse(@input[0].chars, 0, 4)
    end

    def solution2
      traverse(@input[0].chars, 0, 14)
    end

    private

    def traverse(signals, pos, size)
      packet = signals[pos, size]
      return pos + size if packet.uniq.length == size
      traverse(signals, pos + 1, size)
    end
  end
end
