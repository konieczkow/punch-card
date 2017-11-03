class OutCommand
  def self.regexp
    regexes = [
      /^out\!?$/i,
      /^off\!?$/i,
      /^(?:out +)(?<option>.*)/i,
      /^(?:off +)(?<option>.*)/i,
      /^bye\!?$/i,
      /^bye everybody\!?$/i,
      /heading home/i
    ]
    Regexp.union(*regexes)
  end

  def initialize(optional_text = nil)
    @optional_text = optional_text
  end

  def execute(client, data)
    PunchCardRepository.new.punch_out_user_with_text(data.user, @optional_text)
  end
end
