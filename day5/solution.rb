# frozen_string_literal: true

module AdventOfCode
  class Day5 < Day
    def solution1
      instructions.reduce(crates.dup) do |cr, i|
        from = i[:from] - 1
        to = i[:to] - 1
        move = cr[from][0, i[:move]]
        cr[from] = cr[from][i[:move]..-1]
        cr[to] = move.reverse + cr[to]
        cr
      end.map { |a| a[0] }.join.gsub(/[\[\]]/, '')
    end

    def solution2
      instructions.reduce(crates.dup) do |cr, i|
        from = i[:from] - 1
        to = i[:to] - 1
        move = cr[from][0, i[:move]]
        cr[from] = cr[from][i[:move]..-1]
        cr[to] = move + cr[to]
        cr
      end.map { |a| a[0] }.join.gsub(/[\[\]]/, '')
    end

    def separator
      @separator ||= @input.find_index(&:empty?)
    end

    def stacks_count
      @stacks_count ||= @input[separator - 1].split(/\s+/).map(&:to_i).max
    end

    def crates
      @crates ||= @input[0..separator - 2].map do |s|
        arr = s.chars.each_slice(4).map(&:join).map(&:strip)
        arr + Array.new(stacks_count - arr.length, "")
      end.transpose.map { |a| a.delete_if(&:empty?) }
    end

    def instructions
      @instructions ||=
        @input[separator + 1..-1]
          .map(&:split)
          .map { |i| Hash[i.each_slice(2).map { |a| [a[0].to_sym, a[1].to_i] }] }
    end
  end
end
