class PunchCardFormatter
  def initialize(punch_card)
    @punch_card = punch_card
  end

  def line(client)
      line = ["\t•", "*#{username(client)}*"]
      line = line | ['-', @punch_card.optional_text] if @punch_card.optional_text
      line.join(' ') + "\n"
  end

  private

  def username(client)
     UserFinder.username_from_id(client, @punch_card.user_id)
  end
end
