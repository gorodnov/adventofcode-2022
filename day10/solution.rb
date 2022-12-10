# frozen_string_literal: true

module AdventOfCode
  class Day10 < Day
    def solution1
      (1..220).reduce({ idx: 0, cmd: instruction(0), register: 1, sum: [] }) do |state, cycle|
        state => { idx:, cmd:, register:, sum: }
        sum = [20, 60, 100, 140, 180, 220].include?(cycle) ? sum << register * cycle : sum
        case cmd
        in [1, v]
          { idx: idx + 1, cmd: instruction(idx + 1), register: register + v, sum: }
        in [2, v]
          { idx:, cmd: [1, v], register:, sum: }
        end
      end[:sum].sum
    end

    def solution2
      (1..240).reduce({ idx: 0, cmd: instruction(0), register: 1, crt: [] }) do |state, cycle|
        state => { idx:, cmd:, register:, crt: }
        crt << [] if [1, 41, 81, 121, 161, 201].include? cycle
        pixel_pos = crt[-1].length
        crt[-1] << (pixel_pos >= register - 1 && pixel_pos <= register + 1 ? '#' : '.')
        case cmd
        in [1, v]
          { idx: idx + 1, cmd: instruction(idx + 1), register: register + v, crt: }
        in [2, v]
          { idx:, cmd: [1, v], register:, crt: }
        end
      end[:crt].map(&:join).join("\n").tap { |x| puts x }
    end

    private

    def instruction(idx)
      return nil if idx >= instructions.length
      case instructions[idx]
      in ['addx', v]
        [2, v]
      in ['noop']
        [1, 0]
      end
    end

    def instructions
      @instructions ||= input.map { |s| s.split.then { |i| !!i[1] ? [i[0], i[1].to_i] : i } }
    end
  end
end

