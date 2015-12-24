#!/usr/bin/env ruby

require 'win32/service'
include Win32

svc = ARGV[0]
if Service.exists?(svc)
  if Service.config_info(svc)['start_type']
    puts 'Service is enabled!'
    state = 'enabled'
  else
    puts 'Service is disabled!'
    state = 'disabled'
  end
  return {:svc => state} unless state.nil?
else
  puts "Service doesn't exist!"
end