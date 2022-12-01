require './core'

module AdventOfCode
  def self.solve1
    read_file("#{__dir__}/in.txt")
      .map(&:to_i)
      .chunk_and_map { |i| i > 0 }
      .map(&:sum)
      .max
  end

  def self.solve2
    read_file("#{__dir__}/in.txt")
      .map(&:to_i)
      .chunk_and_map { |i| i > 0 }
      .map(&:sum)
      .sort.last(3)
      .sum
  end
end

puts AdventOfCode.solve1.inspect
puts AdventOfCode.solve2.inspect
