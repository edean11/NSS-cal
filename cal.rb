#!/usr/bin/env ruby
require_relative 'lib/cal_month'
require_relative 'lib/cal_year'

#Checks for invalid input
def two_arguments_validation
    if ARGV.empty? || ARGV[0].to_s.length > 2 || ARGV[0].match(/\d+/).to_s != ARGV[0].chomp.to_s ||
        ARGV[1].to_i<1800 || ARGV[1].to_i>3000 || ARGV[1].match(/\d+/).to_s != ARGV[1].chomp.to_s ||
        ARGV[1].to_s.length != 4
        puts "Date not acceptable format/range
./cal.rb [01-12] [1800-3000]"
    else
    #otherwise, return the calendar month
        month = ARGV[0].to_i
        year = ARGV[1].to_i
        m = Month.new(month,year)
        puts m.to_s
    end
end

def one_argument_validation
    if ARGV.empty? || ARGV[0].to_s.length > 4 || ARGV[0].match(/\d+/).to_s != ARGV[0].chomp.to_s ||
        ARGV[0].to_i<1800 || ARGV[0].to_i>3000 || ARGV[0].to_s.length != 4
        puts "Date not acceptable format/range
./cal.rb [1800-3000]"
    else
    #otherwise, return the calendar year
        year = ARGV[0].to_i
        y = Year.new(year)
        puts y.to_s
    end
end

if ARGV[1]
    two_arguments_validation()
else
    one_argument_validation()
end


