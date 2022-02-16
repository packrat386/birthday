require 'spec_helper'

RSpec.describe Birthday do
  let(:me) { double('me') }

  before { Timecop.freeze(now) }
  after { Timecop.return }

  context 'On some other day' do
    let(:now) { Time.parse('2022-05-05T00:00:00Z') }

    it 'is not my birthday' do
      expect(described_class.is_my_birthday?(me)).to be false
    end
  end

  context 'On November 28th 2022' do
    let(:now) { Time.parse('2022-11-28T00:00:00Z') }

    it 'is my birthday' do
      expect(described_class.is_my_birthday?(me)).to be true
    end
  end
end
