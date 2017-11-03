require 'slack-ruby-bot'
require 'pry'
require 'active_record'
require_relative 'user_finder.rb'
require_relative 'punch_card.rb'
require_relative 'punch_card_repository.rb'
require_relative 'punch_card_formatter.rb'
require_relative 'punch_card_mention_formatter.rb'
require_relative 'status.rb'
require_relative 'commands/out_command.rb'
require_relative 'commands/in_command.rb'
require_relative 'commands/whos_in_command.rb'
require_relative 'commands/whos_out_command.rb'
require_relative 'commands/wheres_everybody_command.rb'
require_relative 'commands/mention_people_in_command.rb'
require_relative 'commands/help_command.rb'

ActiveRecord::Base.establish_connection

class PunchCardBot < SlackRubyBot::Bot
  match InCommand.regexp do |client, data, match|
    InCommand.new(match[:option]).execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'spock-hand'
    )
  end

  match /^office/i do |client, data, _match|
    InCommand.new('In the office').execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'office'
    )
  end

  match /^home/i do |client, data, _match|
    InCommand.new('WFH').execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'house'
    )
  end

  match OutCommand.regexp do |client, data, match|
    OutCommand.new(match[:option]).execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'wave'
    )
  end

  match /^tesco/i do |client, data, _match|
    OutCommand.new('Tesco run').execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'shopping_bags'
    )
  end

  match /^lunch/i do |client, data, _match|
    OutCommand.new('Lunch break').execute(client, data)
    client.web_client.reactions_add(
      channel: data.channel,
      timestamp: data.ts,
      name: 'stew'
    )
  end

  match WhosInCommand.regexp do |client, data, _match|
    response = WhosInCommand.new.execute(client, data)
    unless response.empty?
      client.say(text: response, channel: data.channel)
    else
      client.say(text: 'You are here all alone!', channel: data.channel)
    end
  end

  match /^who[‘’']s out\??$/i do |client, data, _match|
    response = WhosOutCommand.new.execute(client, data)
    unless response.empty?
      client.say(text: response, channel: data.channel)
    else
      client.say(text: 'You are here all alone!', channel: data.channel)
    end
  end

  match /^where[‘’']s everybody\??$/i do |client, data, _match|
    response = WheresEverybodyCommand.new.execute(client, data)
    unless response.empty?
      client.say(text: response, channel: data.channel)
    else
      client.say(text: 'You are here all alone!', channel: data.channel)
    end
  end

  match MentionPeopleInCommand.regexp do |client, data, match|
    response = MentionPeopleInCommand.new(match[:message]).execute(client, data)
    client.say(text: response, channel: data.channel)
  end

  match HelpCommand.regexp do |client, data, _match|
    response = HelpCommand.new.execute
    client.say(text: response, channel: data.channel)
  end

end

