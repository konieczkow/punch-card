class PunchCard < ActiveRecord::Base
  def punch_in_with_text(text)
    update_attributes(status_id: Status.in.id, optional_text: text)
  end

  def punch_out_with_text(text)
    update_attributes(status_id: Status.out.id, optional_text: text)
  end

  def self.with_in
    where(status_id: Status.in.id)
  end

  def self.with_out
    where(status_id: Status.out.id)
  end

  def self.in_ids
    with_in.pluck(:user_id)
  end

  def self.out_ids
    with_out.pluck(:user_id)
  end
end
