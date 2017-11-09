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
SLACK_API_TOKEN="YOUR_SLACK_API_TOKEN" ruby bin/run_bot
```

## Cron tasks

If you want, you can run this task to punch everybody out.
```
SLACK_API_TOKEN="YOUR_SLACK_API_TOKEN" ruby bin/punch_everybody_out
```
For example, you can add it to crontab if some people forget to punch out at the end of the day.

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
* `bye` - same as `out`
* anything that contains `heading home` - same as `out`
* `tesco` - same as `out Tesco run`
* `lunch` - same as `out Lunch break`

*Queries:*

* `who's in` - displays the list of people who punched in
* `who's out` - displays the list of people who punched out
* `who's in the office` - display the list of people who punched in with `hi WFH`
* `who's at home` - display the list of people who punched in with `hi In the office`
* `where's everybody` - displays the list of people who punched in and out
* `mention people in with <message>` - mentions all people who punched in, with a message

_All commands are case insensitive._

## Authors

* **Maciej Gajewski**  - [konieczkow](https://github.com/konieczkow)

## License

This project is licensed under the MIT License - see the LICENSE file for details
