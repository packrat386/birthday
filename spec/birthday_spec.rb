require 'spec_helper'

RSpec.describe Birthday do
  let(:me) { double('me') }
  let(:us_central_tz) { ActiveSupport::TimeZone['America/Chicago'] }

  before { Timecop.freeze(now) }
  after { Timecop.return }

  context 'On some other day' do
    let(:now) { us_central_tz.parse('2022-05-05T00:00:00') }

    it 'is not my birthday' do
      expect(described_class.is_my_birthday?(me)).to be false
    end
  end

  context 'On November 28th 2022' do
    context 'at midgnight' do
      let(:now) { us_central_tz.parse('2022-11-28T00:00:00') }

      it 'is my birthday' do
        expect(described_class.is_my_birthday?(me)).to be true
      end
    end

    context 'at 8 AM' do
      let(:now) { us_central_tz.parse('2022-11-28T08:00:00') }

      it 'is my birthday' do
        expect(described_class.is_my_birthday?(me)).to be true
      end
    end

    context 'at 11 PM' do
      let(:now) { us_central_tz.parse('2022-11-28T23:00:00') }

      it 'is my birthday' do
        expect(described_class.is_my_birthday?(me)).to be true
      end
    end
  end
end
