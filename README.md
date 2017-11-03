# Punch Card Bot

A bot that keeps track of who's in and who's out of the office.

## Running the tests

```
bundle install
rspec
```

## Running the bot

```
bundle install
SLACK_API_TOKEN="YOUR_SLACK_API_TOKEN" ruby run_bot
```

## Accepted commands

*Punching in:*

* `hi`, `hi!`, `hi <optional text>` - punches you in
* `in`, `in!`, `in <optional text>` - same as `hi`
* `hello`, `hello!`, `hello <optional text>` - same as `hi`
* `morning` - same as `hi`
* `office` - same as `hi In the office`
* `home` - same as `hi WFH`

*Punching out:*

* `out`, `out <optional text>` - punches you out
* `off`, `off <optional text>` - same as `out`
* anything that contains `heading home` - same as `out`
* `tesco` - same as `out Tesco run`
* `lunch` - same as `out Lunch break`

*Queries:*

* `who's in` - displays the list of people who punched in
* `who's out` - displays the list of people who punched out
* `where's everybody` - displays the list of people who punched in and out
* `mention people in with <message>` - mentions all people who punched in, with a message

_All commands are case insensitive._

## Authors

* **Maciej Gajewski**  - [konieczkow](https://github.com/konieczkow)

## License

This project is licensed under the MIT License - see the LICENSE file for details
