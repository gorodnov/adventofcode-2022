# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode::Day9 do
  let(:input_file) { 'in.txt' }
  let(:input) { AdventOfCode.read_file("#{__dir__}/#{input_file}") }
  subject { described_class.new input }

  describe 'solution 1' do
    it { expect(subject.solution1).to eq(13) }
  end

  describe 'solution 2' do
    describe 'input 1' do
      it { expect(subject.solution2).to eq(1) }
    end

    describe 'input 2' do
      let(:input_file) { 'in2.txt' }
      it { expect(subject.solution2).to eq(36) }
    end
  end
end
