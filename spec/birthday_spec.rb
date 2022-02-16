require 'spec_helper'

RSpec.describe Birthday do
  let(:me) { double('me') }

  it 'knows if it is my birthday' do
    expect(described_class.is_my_birthday?(me)).to be false
  end
end
