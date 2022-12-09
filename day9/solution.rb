# frozen_string_literal: true

module AdventOfCode
  class Day9 < Day
    def solution1
      solution(2)
    end

    def solution2
      solution(10)
    end

    private

    def solution(knots_count)
      input
        .map { |s| s.split.then { |a| { direction: a[0], steps: a[1].to_i } } }
        .reduce({ knots: Array.new(knots_count, [0, 0]), positions: [[0, 0]] }) { |state, motion| step(motion[:direction], motion[:steps], state) }
        .then { |x| x[:positions].uniq.length }
    end

    def step(direction, num, state)
      return state if num == 0
      state[:knots] => [head, *tails]
      new_head = head_new_pos(direction, head)
      knots = tails.reduce([new_head]) do |new_knots, pos|
        new_knots << tail_new_pos(new_knots[-1], pos)
      end
      positions = state[:positions] << knots[-1]
      step(direction, num - 1, { knots:, positions: })
    end

    def head_new_pos(direction, current)
      current => [x, y]
      case direction
      when 'U'
        [x, y + 1]
      when 'R'
        [x + 1, y]
      when 'D'
        [x, y - 1]
      when 'L'
        [x - 1, y]
      else
        # do nothing
      end
    end

    def tail_new_pos(h_pos, t_pos)
      h_pos => [hx, hy]; t_pos => [tx, ty]
      if (hx - tx).abs > 1 && (hy - ty).abs > 1
        [hx > tx ? tx + 1 : tx - 1, hy > ty ? ty + 1 : ty - 1]
      elsif (hx - tx).abs > 1
        [hx > tx ? tx + 1 : tx - 1, hy]
      elsif (hy - ty).abs > 1
        [hx, hy > ty ? ty + 1 : ty - 1]
      else
        [tx, ty]
      end
    end
  end
end
