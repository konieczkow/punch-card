require 'active_record'
require_relative 'punch_card.rb'
require_relative 'status.rb'

ActiveRecord::Base.establish_connection

puts "Punching everybody out..."
PunchCard.punch_everybody_out
