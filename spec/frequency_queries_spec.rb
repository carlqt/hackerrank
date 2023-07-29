# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/frequency_queries/frequency_queries'

describe FrequencyQueries do
  describe '.run' do
    subject(:frequency_queries) { described_class.run(queries) }

    context 'when [[1,1],[2,2],[3,2],[1,1],[1,1],[2,1],[3,2]]' do
      let(:queries) { [[1, 1], [2, 2], [3, 2], [1, 1], [1, 1], [2, 1], [3, 2]] }

      it { is_expected.to eq [0, 1] }
    end

    context 'when [[3,1]]' do
      let(:queries) { [[3, 1]] }
      it { is_expected.to eq [0] }
    end

    context 'when [[3,1], [1,2]]' do
      let(:queries) { [[3, 1], [1, 2], [2, 2], [1, 2], [3, 1]] }
      it { is_expected.to eq [0, 1] }
    end

    context 'when [[1, 1], [1, 1], [3, 1]]' do
      let(:queries) { [[1, 1], [1, 1], [3, 1]] }

      it { is_expected.to eq [0] }
    end

    context 'when input.txt' do
      let(:queries) do
        inputs = []

        File.foreach('input.txt') do |line|
          inputs << line.rstrip.split.map(&:to_i)
        end

        inputs
      end

      it 'is the same as output.txt' do
        File.foreach('output.txt').with_index do |line, index|
          expect(frequency_queries[index]).to eq(line.to_i), "Expected: #{line} on index #{index}"
        end
      end
    end

    context 'when [[1, 1], [3, 1], [2, 1], [3, 1]]' do
      let(:queries) { [[1, 1], [3, 1], [2, 1], [3, 1]] }

      it { is_expected.to eq [1, 0] }
    end
  end
end
