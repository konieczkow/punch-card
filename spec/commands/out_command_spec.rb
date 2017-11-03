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
end

