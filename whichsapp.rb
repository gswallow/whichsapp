#!/usr/bin/env ruby

require 'yaml'
require 'etcd'

config = YAML.load_file(File.expand_path('../config.yml', __FILE__))
puts config
etcd = Etcd.client(host: config['settings']['info_server'], port: 4001)

etcd.get('/apps').children.each do |app|
  #versions = Hash.new
  app.children.each do |server|
    puts server.inspect
  end
end

# require 'sinatra/base'
# require 'sinatra/config_file'
# require 'etcd'
# require 'yaml'
#
# class Whichsapp < Sinatra::Base
#   register Sinatra::ConfigFile
#   config_file File.expand_path('../config.yml', __FILE__)
#
#   configure :production, :development do
#     enable :logging
#   end
#
#   before do
#     @etcd = Etcd.client(host: settings['settings']['info_server'], port: 4001)
#   end
#
#   get '/apps' do
#     @etcd.get('/apps').inspect.to_s
#     #erb :page, :locals => { :page => 'apps', :key => @etcd.get('/apps/') }
#   end
#
#   # get '/assays' do
#   #   erb :page, :locals => { :page => 'assays', :key => @etcd.get('/assays/') }
#   # end
#   #
#   # get '/packages' do
#   #   erb :page, :locals => { :page => 'packages', :key => @etcd.get('/packages/') }
#   # end
#
#   run! if app_file == $0
# end
