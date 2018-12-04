require 'spec_helper'
require_relative '../app/sherlock_anagram/anagram'

describe SherlockAnagram do
  describe "#run" do
    subject { described_class.new(input).run }

    context "when input 'ifailuhkqq'" do
      let(:input) { 'ifailuhkqq' }

      it { is_expected.to eq 2 }
    end

    context "when input 'abba'" do
      let(:input) { 'abba' }

      it { is_expected.to eq 2 }
    end

    context "when input 'abcd'" do
      let(:input) { 'abcd' }

      it { is_expected.to eq 0 }
    end

    context "when input 'cdcd'" do
      let(:input) { 'cdcd' }

      it { is_expected.to eq 5 }
    end

    context "when input 'kkkk'" do
      let(:input) { 'kkkk' }

      it { is_expected.to eq 10 }
    end
  end
end
