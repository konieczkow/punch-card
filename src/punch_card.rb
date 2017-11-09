class PunchCard < ActiveRecord::Base
  def punch_in_with_text(text)
    update_attributes(status_id: Status.in.id, optional_text: text)
  end

  def punch_out_with_text(text)
    update_attributes(status_id: Status.out.id, optional_text: text)
  end

  def punch_out
    update_attributes(status_id: Status.out.id)
  end

  def self.punch_everybody_out
    all.each(&:punch_out)
  end

  def self.at_home
    where(optional_text: 'WFH')
  end

  def self.in_the_office
    where(optional_text: 'In the office')
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
