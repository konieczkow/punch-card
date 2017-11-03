class PunchCardMentionFormatter
  def initialize(punch_card)
    @punch_card = punch_card
  end

  def line
    "<@#{@punch_card.user_id}>"
  end
end
