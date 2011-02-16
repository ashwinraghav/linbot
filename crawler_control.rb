require 'rubygems'
require 'bundler/setup'


Bundler.require(:default)
require 'crawler.rb'
Daemons.run('runner.rb')
