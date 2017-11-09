class WhosInTheOfficeCommand
  def self.regexp
    regexes = [
      /^who[‘’']s (?:in the )?office\??$/i,
      /^who is (?:in the )office\??$/i
    ]
    Regexp.union(*regexes)
  end

  def execute(client, _data)
    header + formatted_list_of_people_ids(client)
  end

  private

  def header
    "*People in the office:*\n"
  end

  def formatted_list_of_people_ids(client)
    PunchCard.in_the_office.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end
end
