require 'readline'
require 'pry'

class CommandParser
  def self.parse(command)
    # remove first slash
    command[0] = ''

    name, option = command.split(' ', 2)
    new(name, option)
  end

  attr_reader :name, :option

  def initialize(name, option)
    @name = name
    @option = option
  end
end

Person = Struct.new(:name, :status, :option)

class PresenceDatabase
  def initialize
    @db = [
      Person.new('Magic', 'in', 'Slightly late'),
      Person.new('Amy', 'out', 'Tesco run'),
      Person.new('Paul', 'out', 'Something else'),
    ]
  end

  def all_people
    @db.map(&:name)
  end

  def people_in
    @db.select { |person| person.status == 'in' }
  end

  def people_out
    @db.select { |person| person.status == 'out' }
  end

  def person_leaves(name)
    @db.find { |p| p.name == name }.status = 'out'
  end

  def person_returns(name)
    @db.find { |p| p.name == name }.status = 'in'
  end
end

class InvalidCommand
  def execute
    "Invalid command!"
  end
end

class OutCommand
  def initialize(option)
  end

  def execute(name, presence_database)
    presence_database.person_leaves(name)
    "Godspeed #{name}!"
  end
end

class InCommand
  def execute(name, presence_database)
    presence_database.person_returns(name)
    "Hi there #{name}!"
  end
end

class WhosInCommand
  def execute(presence_database)
    presence_database.people_in.map do |person|
      "#{person.name}\n"
    end.join
  end
end

class PunchCardBot
  def initialize
    @presence_database = PresenceDatabase.new
  end

  def react_to(line, invoked_by)
    return line unless is_a_command?(line)

    parsed_command = CommandParser.parse(line)

    case parsed_command.name
    when 'out'
      OutCommand.new(parsed_command.option).execute(invoked_by, @presence_database)
    when 'in', 'back', 'hi'
      InCommand.new.execute(invoked_by, @presence_database)
    when 'lunch'
      OutCommand.new('Lunch break').execute(invoked_by, @presence_database)
    when 'tesco'
      OutCommand.new('Tesco run').execute(invoked_by, @presence_database)
    when 'whos_in'
      WhosInCommand.new.execute(@presence_database)
    else
      InvalidCommand.new.execute
    end
  end

  private

  def is_a_command?(line)
    line.start_with?('/')
  end
end

bot = PunchCardBot.new
while line = Readline.readline('> ', true)
  response = bot.react_to(line, 'Magic')
  puts response
end

puts "Bye! 👋"
