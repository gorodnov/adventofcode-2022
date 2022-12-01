# frozen_string_literal: true

module Enumerable
  def chunk_and_map(&block)
    self.chunk(&block).select { |i| i[0] }.map { |i| i[1] }
  end
end

module AdventOfCode
  def self.read_file(path)
    File.readlines(path, chomp: true)
  end
end
