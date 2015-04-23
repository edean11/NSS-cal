require_relative 'cal_month'

#Checks for invalid input
if(ARGV.empty? || ARGV[0].to_s.length > 2 || ARGV[0].match(/\d/).to_s != ARGV[0].to_s ||
	ARGV[1].to_i<1800 || ARGV[1].to_i>3000 || ARGV[1].match(/\d/).to_s != ARGV[1].to_s ||
	ARGV[1].to_s.length != 4)
	puts "Date not acceptable format/range
./cal.rb [01-12] [1800-3000]"
end

class Year
	attr_reader :year
	def initialize(year)
		@year = year.to_i
	end
	def leap?
		if year % 4 == 0 && year % 100 == 0 &&
			year % 400 == 0
			return true
		elsif year % 4 == 0 && year % 100 == 0 &&
			year % 400 != 0
			return false
		elsif year % 4 == 0 && year % 100 != 0
			return true
		else
			return false
		end
	end
end

