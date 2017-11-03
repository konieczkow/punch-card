class WheresEverybodyCommand
  def execute(client, _data)
    header_for_people_in +
      formatted_list_of_people_in_ids(client) +
      header_for_people_out +
      formatted_list_of_people_out_ids(client)
  end

  private

  def header_for_people_in
    "*People who punched in:*\n"
  end

  def header_for_people_out
    "*People out:*\n"
  end

  def formatted_list_of_people_in_ids(client)
    PunchCard.with_in.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end

  def formatted_list_of_people_out_ids(client)
    PunchCard.with_out.map do |punch_card|
      PunchCardFormatter.new(punch_card).line(client)
    end.join
  end
end
