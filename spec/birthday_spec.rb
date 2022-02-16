require 'spec_helper'

RSpec.describe Birthday do
  let(:me) { double('me', tz: my_tz) }
  let(:us_central_tz) { ActiveSupport::TimeZone['America/Chicago'] }
  let(:london_tz) { ActiveSupport::TimeZone['Europe/London'] }
  let(:my_tz) { us_central_tz }

  before { Timecop.freeze(now) }
  after { Timecop.return }

  context 'on some other day' do
    let(:now) { us_central_tz.parse('2022-05-05T00:00:00') }

    it 'is not my birthday' do
      expect(described_class.is_my_birthday?(me)).to be false
    end
  end

  context 'on November 28th 2022' do
    context 'I am in Chicago' do
      let(:my_tz) { us_central_tz }

      context 'at 5 AM in London' do
        let(:now) { london_tz.parse('2022-11-28T05:00:00') }

        it 'is not my birthday' do
          expect(described_class.is_my_birthday?(me)).to be false
        end
      end

      context 'at midgnight in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T00:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end

      context 'at 8 AM in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T08:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end

      context 'at 11 PM in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T23:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end
    end

    context 'I am in London' do
      let(:my_tz) { london_tz }

      context 'at 5 AM in London' do
        let(:now) { london_tz.parse('2022-11-28T05:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end

      context 'at midgnight in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T00:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end

      context 'at 8 AM in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T08:00:00') }

        it 'is my birthday' do
          expect(described_class.is_my_birthday?(me)).to be true
        end
      end

      context 'at 11 PM in Chicago' do
        let(:now) { us_central_tz.parse('2022-11-28T23:00:00') }

        it 'is not my birthday' do
          expect(described_class.is_my_birthday?(me)).to be false
        end
      end
    end
  end
end
