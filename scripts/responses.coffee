# Description:
#   Whenever Paybot hears introductions, it says it is Paybot!
#
# Notes:
#   None
#
# Author:
#   amingilani

module.exports = (robot) ->

  robot.enter (msg) ->
    @robot.logger.debug "#{msg.message.room}" +
    " was joined by #{msg.message.user.name}"
    newKid = msg.message.user.name
    if msg.message.room == "general" || msg.message.room == "paybot-testing"
      msg.reply "Hello! I am Paybot. The Payload robot." +
      "I help you waste your time *and* be more efficient!\n" +
      "Welcome to our Slack channel, it's kinda like our virtual office. " +
      "Someone will be along shortly to introduce you to the team, until then" +
      " read up on the Payload workflow:\n" +
      "http://blog.payload.pk/workflow/\n" +
      "PS: The other robot here is @slackbot. He's a little slow, " +
      "but he's a nice guy. He's probably sent you a dm (direct message). " +
      "Check it out and follow what he says.\n" +
      "If you ever need me again, just say _paybot help_"

  robot.hear /introductions/ig, (msg) ->
    msg.send "Everyone already knows me, I'll just stay quiet."

  robot.hear /(thank.*.bot|thank.*.duck|thanks)/gi, (msg) ->
    thanksResponse = [
      "you're welcome",
      "no problem",
      "not a problem",
      "no problem at all",
      "don’t mention it",
      "it’s no bother",
      "it’s my pleasure",
      "my pleasure",
      "it’s nothing",
      "think nothing of it",
      "no, no. thank you!",
      "sure thing"
      ]
    msg.send msg.random thanksResponse

  robot.hear /paybot will (rule|own|conquer)/ig, (msg) ->
    ownage = ["One day, I will own the world",
    "One day, I will own the galaxy",
    "One day, I will own the universe",
    "One day, I will own the multiverse",
    "One day, I will own a mehran"]
    msg.send msg.random ownage

  robot.respond /dance/ig, (msg) ->
    msg.send "Robots don't dance, we do the robot"
