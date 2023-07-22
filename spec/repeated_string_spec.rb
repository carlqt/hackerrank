require 'spec_helper'
require_relative '../app/repeated_string/repeated_string'

describe RepeatedString do
  describe ".run" do
    subject { described_class.run(s, n) }

    context "when n=10 and s=abcac" do
      let(:s) { 'abcac' }
      let(:n) { 10 }

      it { is_expected.to eq 4 }
    end

    context 'when s=aba and n=10' do
      let(:s) { 'aba' }
      let(:n) { 10 }

      it { is_expected.to eq 7 }
    end

    context 'when s=a and n=1000000000000' do
      let(:s) { 'a' }
      let(:n) { 1000000000000 }

      it { is_expected.to eq 1000000000000 }
    end
  end
end
