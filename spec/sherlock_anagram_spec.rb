require 'spec_helper'
require_relative '../app/sherlock_anagram/sherlock_anagram'

describe SherlockAnagram do
  describe "#run" do
    subject { described_class.run(input) }

    context "when input 'ifailuhkqq'" do
      let(:input) { 'ifailuhkqq' }

      it { is_expected.to eq 3 }
    end

    context "when input 'abba'" do
      let(:input) { 'abba' }

      it { is_expected.to eq 4 }
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

    context "when input 'mom'" do
      let(:input) { 'mom' }

      it { is_expected.to eq 2 }
    end

    context 'when input is ifailuhkqqhucpoltgtyovarjsnrbfpvmupwjjjfiwwhrlkpekxxnebfrwibylcvkfealgonjkzwlyfhhkefuvgndgdnbelgruel' do
      let(:input) { 'ifailuhkqqhucpoltgtyovarjsnrbfpvmupwjjjfiwwhrlkpekxxnebfrwibylcvkfealgonjkzwlyfhhkefuvgndgdnbelgruel'}

      it { is_expected.to eq 399}
    end

    context 'when input is gffryqktmwocejbxfidpjfgrrkpowoxwggxaknmltjcpazgtnakcfcogzatyskqjyorcftwxjrtgayvllutrjxpbzggjxbmxpnde' do
      let(:input) { 'gffryqktmwocejbxfidpjfgrrkpowoxwggxaknmltjcpazgtnakcfcogzatyskqjyorcftwxjrtgayvllutrjxpbzggjxbmxpnde' }

      it { is_expected.to eq 471 }
    end
  end

  # describe '#substrings' do
  #   subject { described_class.new.substrings(input) }

  #   context 'when input is abba' do
  #     let(:input) { 'abba' }

  #     it { is_expected.to eq ['a','ab','abb','abba','b','bb','bba','b','ba','a']  }
  #   end
  # end
end
