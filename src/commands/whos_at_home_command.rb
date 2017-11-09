class WhosAtHomeCommand
  def self.regexp
    regexes = [
      /^who[‘’']s (?:at )?home\??$/i,
      /^who is (?:at) home\??$/i
    ]
    Regexp.union(*regexes)
  end

  def execute(client, _data)
    header + formatted_list_of_people_ids(client)
  end

  private

  def header
    "*People at home:*\n"
  end

  def formatted_list_of_people_ids(client)
    PunchCard.at_home.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end
end
