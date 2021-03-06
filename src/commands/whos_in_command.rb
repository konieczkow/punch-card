class WhosInCommand
  def self.regexp
    regexes = [
      /^who[‘’']s in\??$/i,
      /^who is in\??$/i
    ]
    Regexp.union(*regexes)
  end

  def execute(client, _data)
    header + formatted_list_of_people_ids(client)
  end

  private

  def header
    "*People who punched in:*\n"
  end

  def formatted_list_of_people_ids(client)
    PunchCard.with_in.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end
end
