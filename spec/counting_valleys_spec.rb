require 'spec_helper'
require_relative '../app/counting_valleys/counting_valleys'

describe CountingValleys do
  describe ".count" do
    let(:n) { arr.chars.size }

    subject { described_class.count(n, arr) }

    context "when input DDUUUUDD" do
      let(:arr) { 'DDUUUUDD' }

      it { is_expected.to eq 1 }
    end

    context 'when UDDDUDUU' do
      let(:arr) { 'UDDDUDUU' }

      it { is_expected.to eq 1 }
    end

    context 'when DDUUDDUDUUUD' do
      let(:arr) { 'DDUUDDUDUUUD' }

      it { is_expected.to eq 2 }
    end
  end
end
