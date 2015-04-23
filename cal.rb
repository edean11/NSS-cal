#!/usr/bin/env ruby

require_relative 'lib/cal_month'

month = ARGV[0]
year = ARGV[1]

m = Month.new(month,year)
puts m.to_s