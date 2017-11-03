require 'spec_helper'
require 'commands/whos_in_command'

RSpec.describe WhosInCommand do
  context 'matched' do
    subject { described_class }

    it { should answer_to "who's in" }
    it { should answer_to "who’s in" }
    it { should answer_to "who‘s in" }
    it { should answer_to "who's in?" }
  end
end
