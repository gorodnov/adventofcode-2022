# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode::Day10 do
  subject { described_class.new AdventOfCode.read_file("#{__dir__}/in.txt") }
  it { expect(subject.solution1).to eq(13140) }
  it {
    s = "##..##..##..##..##..##..##..##..##..##..\n" \
        "###...###...###...###...###...###...###.\n" \
        "####....####....####....####....####....\n" \
        "#####.....#####.....#####.....#####.....\n" \
        "######......######......######......####\n" \
        "#######.......#######.......#######....."
    expect(subject.solution2).to eq(s)
  }
end
