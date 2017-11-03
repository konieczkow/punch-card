class Status < ActiveRecord::Base
  def self.in
    find_by(name: 'In')
  end

  def self.out
    find_by(name: 'Out')
  end
end
