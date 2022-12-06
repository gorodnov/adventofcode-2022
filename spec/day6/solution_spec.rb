# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode::Day6 do
  describe 'solution 1' do
    it { expect(described_class.new(['mjqjpqmgbljsphdztnvjfqwrcgsmlb']).solution1).to eq(7) }
    it { expect(described_class.new(['bvwbjplbgvbhsrlpgdmjqwftvncz']).solution1).to eq(5) }
    it { expect(described_class.new(['nppdvjthqldpwncqszvftbrmjlhg']).solution1).to eq(6) }
    it { expect(described_class.new(['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg']).solution1).to eq(10) }
    it { expect(described_class.new(['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw']).solution1).to eq(11) }
  end

  describe 'solution 2' do
    it { expect(described_class.new(['mjqjpqmgbljsphdztnvjfqwrcgsmlb']).solution2).to eq(19) }
    it { expect(described_class.new(['bvwbjplbgvbhsrlpgdmjqwftvncz']).solution2).to eq(23) }
    it { expect(described_class.new(['nppdvjthqldpwncqszvftbrmjlhg']).solution2).to eq(23) }
    it { expect(described_class.new(['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg']).solution2).to eq(29) }
    it { expect(described_class.new(['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw']).solution2).to eq(26) }
  end
end
