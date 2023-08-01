# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/common_child/common_child'

describe '#common_child' do
  subject { common_child(s1, s2) }

  context 'when s1=ABCD s2=ABDC' do
    let(:s1) { 'ABCD' }
    let(:s2) { 'ABDC' }

    it { is_expected.to eq 3 }
  end

  context 'when s1=ABCD s2=ABDC' do
    let(:s1) { 'HARRY' }
    let(:s2) { 'SALLY' }

    it { is_expected.to eq 2 }
  end

  context 'when str1=SHINCHAN s2=NOHARAAA' do
    let(:s1) { 'SHINCHAN' }
    let(:s2) { 'NOHARAAA' }

    it { is_expected.to eq 3 }
  end

  context 'when str1=ABCDEF s2=FBDAMN' do
    let(:s1) { 'ABCDEF' }
    let(:s2) { 'FBDAMN' }

    it { is_expected.to eq 2 }
  end

  context 'when str1=AA s2=BB' do
    let(:s1) { 'AA' }
    let(:s2) { 'BB' }

    it { is_expected.to eq 0 }
  end

  context 'when str1=STONE s2=LONGEST' do
    let(:s1) { 'STONE' }
    let(:s2) { 'LONGEST' }

    it { is_expected.to eq 3 }
  end
end
