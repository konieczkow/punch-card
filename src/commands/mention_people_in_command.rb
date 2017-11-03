class MentionPeopleInCommand
  def self.regexp
    regexes =[
      /^mention people in with (?<message>.*)/i,
      /^mention all in (?<message>.*)/i
    ]
    Regexp.union(*regexes)
  end

  def initialize(message)
    @message = message
  end

  def execute(client, data)
    PunchCard.with_in.map do |punch_card|
      PunchCardMentionFormatter.new(punch_card).line
    end.join(", ") + " -> " + @message
  end
end
