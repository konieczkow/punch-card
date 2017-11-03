class WhosOutCommand
  def execute(client, _data)
    header + formatted_list_of_people_ids(client)
  end

  private

  def header
    "*People who punched out:*\n"
  end

  def formatted_list_of_people_ids(client)
    PunchCard.with_out.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end
end
