class InCommand
  def self.regexp
    regexes = [
      /^(?:hi\!?$)/i,
      /^(?:in\!?$)/i,
      /^(?:hello\!?$)/i,
      /^(?:hi +)(?<option>.*)/i,
      /^(?:in +)(?<option>.*)/i,
      /^(?:hello +)(?<option>.*)/i,
      /^(?:morning)/i,
      /^(?:back)/i
    ]
    Regexp.union(*regexes)
  end

  def initialize(optional_text = nil)
    @optional_text = optional_text
  end

  def execute(client, data)
    PunchCardRepository.new.punch_in_user_with_text(data.user, @optional_text)
  end
end

