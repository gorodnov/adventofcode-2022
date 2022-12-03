# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode::Day3 do
  subject { described_class.new AdventOfCode.read_file("#{__dir__}/in.txt") }
  it { expect(subject.solution1).to eq(157) }
  it { expect(subject.solution2).to eq(70) }
end
