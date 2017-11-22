class HelpCommand
  def self.regexp
    regexes = [
      /^(?:how to\??$)/,
      /^(?:help$)/
    ]
    Regexp.union(*regexes)
  end

  def execute
    <<~HELP_MESSAGE
      *Punching in:*
      \t`hi`, `hi!`, `hi <optional text>` - punches you in
      \t`in`, `in!`, `in <optional text>` - same as `hi`
      \t`hello`, `hello!`, `hello <optional text>` - same as `hi`
      \t`morning` - same as `hi`
      \t`office` - same as `hi In the office`
      \t`home` - same as `hi WFH`
      \t`meeting` - same as `hi In a meeting`
      *Punching out:*
      \t`out`, `out <optional text>` - punches you out
      \t`off`, `off <optional text>` - same as `out`
      \tanything that contains `heading home` - same as `out`
      \t`tesco` - same as `out Tesco run`
      \t`lunch` - same as `out Lunch break`
      *Queries:*
      \t`who's in` - displays the list of people who punched in
      \t`who's out` - displays the list of people who punched out
      \t`where's everybody` - displays the list of people who punched in and out
      \t`mention people in with <message>` - mentions all people who punched in, with a message
      _All commands are case insensitive._
    HELP_MESSAGE
  end
end
