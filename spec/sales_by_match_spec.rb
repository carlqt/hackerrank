# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/sales_by_match/sales_by_match'

describe SalesByMerchant do
  describe '.sock_merchant' do
    let(:n) { arr.size }

    subject { described_class.sock_merchant(n, arr) }

    context 'when input [1,2,1,2,1,3,2]' do
      let(:arr) { [1, 2, 1, 2, 1, 3, 2] }

      it { is_expected.to eq 2 }
    end

    context 'when [10, 20, 20, 10, 10, 30, 50, 10, 20]' do
      let(:arr) { [10, 20, 20, 10, 10, 30, 50, 10, 20] }

      it { is_expected.to eq 3 }
    end
  end
end
