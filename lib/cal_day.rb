
#This class utilizes Zeller's Congruence to find the day of the week
#<https://en.wikipedia.org/wiki/Zeller's_congruence>
# h = (q + ((13*(m+1))/5) + K + (K/4) + (J/4) + 5*J) % 7
# h is the day of the week (0=Saturday...6=Friday)
# q is the day of the month
# m is the month (3 = March...14=February)
# K is the year of the century (i.e. year % 100)
# J is the zero-based century (i.e. first two numbers of year)

class Day

	attr_reader :month,:day,:year

	$day_number_key = ["Sa","Su","Mo","Tu","We","Th","Fr"]

	def initialize(month,day,year)
		@month = month.to_i
		@day = day.to_i
		@year = year.to_i
	end

	def get_month_year_formula_number
		m = 0
		y = 0
		if month < 3
			m = month+12
			y = year-1
		else
			m = month
			y = year
		end
		[m,y]
	end

	def to_s
		q = day
		m = get_month_year_formula_number[0]
		k = get_month_year_formula_number[1] % 100
		j = get_month_year_formula_number[1].to_s[0,2].to_i
		day_digit = (q + ((13*(m+1))/5) + k + (k/4) + (j/4) + 5*j) % 7
		return day_digit
	end
end