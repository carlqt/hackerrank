require 'spec_helper'
require_relative '../app/sherlock_string/sherlock_string'

describe '#isValid' do
  subject { isValid(input) }

  context 'when abc' do
    let(:input) { 'abc' }

    it { is_expected.to eq 'YES' }
  end

  # { a: 1, b: 1, c: 3}
  # { 1: 2, 3: 1 }
  context 'when abccc' do
    let(:input) { 'abccc' }

    it { is_expected.to eq 'NO' }
  end

  # {a: 2, b: 2, c: 1, d: 1}
  # { 2: 2, 1: 2 }
  context 'when aabbcd' do
    let(:input) { 'aabbcd' }
    it { is_expected.to eq 'NO' }
  end

  context 'when abcdefghhgfedecba' do
    let(:input) { 'abcdefghhgfedecba' }

    it { is_expected.to eq 'YES' }
  end

  context'when aaaabbbbp' do
    let(:input) { 'aaaabbbbp' }

    it { is_expected.to eq 'YES' }
  end
end
