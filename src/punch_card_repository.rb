class PunchCardRepository
  def punch_in_user_with_text(user_id, text)
    PunchCard.where(user_id: user_id).first_or_create.punch_in_with_text(text)
  end

  def punch_out_user_with_text(user_id, text)
    PunchCard.where(user_id: user_id).first_or_create.punch_out_with_text(text)
  end
end
