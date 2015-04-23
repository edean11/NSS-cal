
#This class utilizes Zeller's Congruence to find the day of the week
#<https://en.wikipedia.org/wiki/Zeller's_congruence>
# h = (q + ((13*(m+1))/5) + K + (K/4) + (J/4) + 5J) % 7
# h is the day of the week (0=Saturday...6=Friday)
# q is the day of the month
# m is the month (3 = March...14=February)
# K is the year of the century (i.e. year % 100)
# J is the zero-based century (i.e. first two numbers of year)

class Day

	attr_reader :month,:day,:year

	$day_number_key = {
		0 => "Sa",
		1 => "Su",
		2 => "Mo",
		3 => "Tu",
		4 => "We",
		5 => "Th",
		6 => "Fr"
	}

	def initialize(month,day,year)
		@month = month.to_i
		@day = day.to_i
		@year = year.to_i
	end

	def get_month_formula_number(month)
		num = 0
		if month < 3
			num = month+12
		else num = month
		end
		num
	end

	def to_s
		q = day
		m = get_month_formula_number(month)
		k = year % 100
		j = year.to_s[0,2].to_i
		day_digit = (q + ((13*(m+1))/5) + k + (k/4) + (j/4) + 5*j) % 7
		return $day_number_key[day_digit]
	end
end