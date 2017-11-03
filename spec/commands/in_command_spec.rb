require 'spec_helper'
require 'commands/in_command'

class PunchCardRepository; end
class UserFinder; end

RSpec.describe InCommand do
  context 'matches' do
    subject { described_class }

    it { should answer_to 'hi' }
    it { should answer_to 'hi!' }
    it { should_not answer_to 'hihi' }
    it { should_not answer_to ' hi' }
    it { should answer_to 'in' }
    it { should answer_to 'in!' }
    it { should_not answer_to 'inside' }
    it { should answer_to 'hello' }
    it { should answer_to 'hello!' }
    it { should_not answer_to 'helloz' }
    it { should answer_to('hi everybody').and_capture(option: 'everybody') }
    it { should answer_to('in everybody').and_capture(option: 'everybody') }
    it { should answer_to('hello everybody').and_capture(option: 'everybody') }
    it { should answer_to('morning everybody') }
    it { should answer_to('back') }
    it { should answer_to('office') }
    it { should answer_to('office!') }
  end

  it 'greets the person using the command' do
    client = double('client')
    data = double('data', user: 'magic_id')
    punch_card = double('punch_card')
    allow_any_instance_of(PunchCardRepository).to receive(:punch_in_user_with_text)
    allow(UserFinder).to receive(:username_from_id).and_return('magic')

    expect(described_class.new.execute(client, data)).to eq('Hi there magic!')
  end
end

