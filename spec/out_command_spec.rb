require 'spec_helper'
require 'commands/out_command'

class PunchCardRepository; end
class UserFinder; end

RSpec.describe OutCommand do
  context 'matches' do
    subject { described_class }

    it { should answer_to 'out' }
    it { should answer_to 'out!' }
    it { should answer_to 'off' }
    it { should answer_to 'off!' }
    it { should answer_to('out to tesco').and_capture(option: 'to tesco') }
    it { should answer_to('off home').and_capture(option: 'home') }
    it { should answer_to('Okay folks, heading home!') }
    it { should answer_to('heading home') }
  end

  it 'greets the person using the command' do
    client = double('client')
    data = double('data', user: 'magic_id')
    punch_card = double('punch_card')
    allow_any_instance_of(PunchCardRepository).to receive(:punch_out_user_with_text)
    allow(UserFinder).to receive(:username_from_id).and_return('magic')

    expect(described_class.new.execute(client, data)).to eq('Godspeed magic!')
  end
end

