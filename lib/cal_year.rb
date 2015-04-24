require_relative 'cal_month'

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

