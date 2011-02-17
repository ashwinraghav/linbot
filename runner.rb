require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
require 'crawler.rb'

bot = Marvin::Android.new("linkrawl@gmail.com", "thoughtworks")
bot.listen