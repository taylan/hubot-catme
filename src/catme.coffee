# Description:
#   Catme is the most importantest hubot script. This script is based on hubot-catme but uses an API key to get more images.
#
# Dependencies:
#   "cheerio": "~0.19.0"
#
# Configuration:
#   HUBOT_THE_CAT_API_KEY - Obtained from http://thecatapi.com/api-key-registration.html
#
# Commands:
#   hubot cat me - Receive a cat
#   hubot cat bomb N - Get N cats
#   hubot cat categories - List all available categories
#   hubot cat (with|in) category - Receive a cat in the given category

$ = require 'cheerio'
api_key = process.env.HUBOT_THE_CAT_API_KEY

module.exports = (robot) ->

  robot.respond /cat( me)?$/i, (msg) ->
    msg.http("http://thecatapi.com/api/images/get?format=xml&api_key=#{api_key}")
      .get() (err, res, body) ->
        msg.send $(body).find('url').text()

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    count = 5 if count > 5
    msg.http("http://thecatapi.com/api/images/get?format=xml&api_key=#{api_key}&results_per_page=#{count}")
      .get() (err, res, body) ->
        msg.send $(cat).find('url').text() for cat in $(body).find('image')

  robot.respond /cat categories/i, (msg) ->
    msg.http("http://thecatapi.com/api/categories/list")
      .get() (err, res, body) ->
        msg.send $(category).find('name').text() for category in $(body).find('category')

  robot.respond /cat( me)? (with|in)( (\w+))?/i, (msg) ->
    category = msg.match[3] || 'funny'
    msg.http("http://thecatapi.com/api/images/get?format=xml&api_key=#{api_key}&category=#{category}")
      .get() (err, res, body) ->
        if $(body).find('url').length
          msg.send $(body).find('url').text()
        else
          msg.send 'Enter a valid category (type "cat categories" for a list of valid categories)'
