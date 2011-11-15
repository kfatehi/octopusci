#!/usr/bin/env ruby

require 'etc'

puts "Before Setting Process.uid = #{Process.uid}"

u = Etc.getpwnam('octopusci')
Process.uid = u.uid

puts "After Setting Process.uid = #{Process.uid}"
