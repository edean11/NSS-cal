require_relative 'cal_day'

class Month
	attr_reader :month,:year

	$translate_month_table = {1=>"    January",2=>"   February",3=>"     March",4=>"      April",
	5=>"      May",6=>"     June",7=>"     July",8=>"    August",9=>"   September",10=>"    October",
	11=>"   November",12=>"   December"}

	$find_month_day_opening_spaces = {"Su"=>1,"Mo"=>4,"Tu"=>7,"We"=>10,"Th"=>13,"Fr"=>16,"Sa"=>19}

	def initialize(month,year)
		@month = month
		@year = year
	end

	def translate_month(month_num)
		$translate_month_table[month_num]
	end

	def find_days_in_month(month_num,year)
		if month_num == 4 || month_num == 6 ||
			month_num == 9 || month_num == 11
			return 30
		elsif month_num == 2
			y = Year.new(year)
			if y.leap?
				return 29
			else
				return 28
			end
		else
			return 31
		end
	end

	def find_opening_day_num_spaces(month,year)
		d = Day.new(month,1,year)
		day_of_week = d.to_s
	end


	def create_date_numbers_string(month_num,year)
		string = ""
		iterator = 1
		iterator_limit = find_days_in_month(month_num,year)
		until iterator > iterator_limit
			if iterator.to_s[1]
				string << "#{iterator} "
			end
		end
	end

	def to_s
		<<EOS
#{translate_month(month)} #{year}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
	end
end