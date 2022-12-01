module AdventOfCode
  def self.solve1
    read_file('in.txt')
      .map(&:to_i)
      .chunk { |i| i > 0 }.select { |i| i[0] }.map { |i| i[1] }
      .map(&:sum)
      .max
  end

  def self.solve2
    read_file('in.txt')
      .map(&:to_i)
      .chunk { |i| i > 0 }.select { |i| i[0] }.map { |i| i[1] }
      .map(&:sum)
      .sort.last(3)
      .sum
  end

  private

  def self.read_file(name)
    File.readlines([__dir__, name].join('/'), chomp: true)
  end
end

puts AdventOfCode.solve1.inspect
puts AdventOfCode.solve2.inspect
