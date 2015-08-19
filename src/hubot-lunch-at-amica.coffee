# Description
#   Tells you the lunch menu at Amica-restaurants in Finland
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Olli Tapaninen <ollitapa@gmail.com>

Util = require "util"

restaurants =
        'garden': 3497
        'biergartten': 3497
        'kartten': 3497
        'smart': 3498
        'smartti': 3498
        'smarthouse': 3498
        'vtt': 3587
        'vtt-oulu': 3587

stripMenu = (json) ->
  menu = for item in json["SetMenus"]
    item["Components"] = for i in item["Components"]
      i.split('(')[0]
    item["Components"].join('\n')

module.exports = (robot) ->


  getLunch = (res, place) ->

    url = "http://www.amica.fi/modules/json/json/Index?costNumber=#{place}&language=fi"

    robot.http(url).get() (err, response, body) ->

      today = new Date()

      data = JSON.parse(body)

      if data["MenusForDays"].length is 0
        res.send "Nothing! Starve, you puny human!!!"
      else
        # Dates to Date()
        dstr["Date"] = new Date dstr["Date"] for dstr in data["MenusForDays"]

        menuToday = stripMenu json for json in data["MenusForDays"] when json["Date"].setHours(1,0,0,0) is today.setHours(1,0,0,0)

        for i in menuToday
          res.send "-----------"
          res.send i





  robot.respond /(.*)(lunch|lounasta|ruokaa) (\w*)+/i, (res)->

    place = res.match[3]

    res.send "Today at #{place}:"
    res.send ""
    getLunch res, restaurants[place] if place of restaurants

  robot.hear /(.*)(ruoka)a+/i, (res)->

    places = Object.keys(restaurants)
    dice = Math.floor(Math.random() * places.length)
    place = places[dice]

    res.send "Today at #{place}:"
    res.send ""
    getLunch res, restaurants[place]

  robot.hear /whats for lunch at (\w*)+/i, (res)->

    place = res.match[1]

    res.send "Today at #{place}:"
    getLunch res, restaurants[place] if place of restaurants