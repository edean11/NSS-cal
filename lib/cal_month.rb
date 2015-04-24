require_relative 'cal_day'
require_relative 'cal_year'

class Month
	attr_reader :month,:year

	def initialize(month,year)
		@month = month
		@year = year
	end

	$translate_month_table = {1=>"January",2=>"February",3=>"March",4=>"April",
	5=>"May",6=>"June",7=>"July",8=>"August",9=>"September",
	10=>"October",11=>"November",12=>"December"}

	$find_month_day_break_point = {"Su"=>7,"Mo"=>6,"Tu"=>5,
		"We"=>4,"Th"=>3,"Fr"=>2,"Sa"=>1}

	def translate_month
		return $translate_month_table[month]
	end

	def find_days_in_month
		if month == 4 || month == 6 ||
			month == 9 || month == 11
			return 30
		elsif month == 2
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

	def calculate_opening_spaces(day)
		spacing_string = ""
		day_opening_spaces_key = {"Su"=>1,"Mo"=>4,"Tu"=>7,"We"=>10,"Th"=>13,"Fr"=>16,"Sa"=>19}
		day_opening_spaces_key[day].times do |num|
			spacing_string << " "
		end
		spacing_string
	end

	def find_opening_spaces_and_break_point
		d = Day.new(month,1,year)
		day_of_week = d.to_s
		break_point = $find_month_day_break_point[day_of_week]
		op_spaces = calculate_opening_spaces(day_of_week)
		return [op_spaces,break_point]
	end


	def create_date_numbers_string
		string = ""
		iterator = 1
		iterator_limit = find_days_in_month
		new_line_iterator = 1
		spacesArr = find_opening_spaces_and_break_point
		op_spaces = spacesArr[0]
		break_point = spacesArr[1]
		string << op_spaces
		until iterator == break_point
			string << "#{iterator}  "
			iterator += 1
		end
		string << "#{iterator}\n"
		iterator += 1
		string << " #{iterator}"
		iterator += 1
		new_line_iterator += 1
		new_line = false
		until iterator > iterator_limit
			if new_line == true && iterator.to_s[1]
				string << "#{iterator}"
				new_line = false
			elsif new_line == true && !iterator.to_s[1]
				string << " #{iterator}"
				new_line = false
			elsif new_line_iterator % 7 == 0 && iterator.to_s[1]
				string << " #{iterator}"
				string << "\n" unless iterator == iterator_limit
				new_line = true
			elsif new_line_iterator % 7 == 0 && !iterator.to_s[1]
				string << "  #{iterator}\n"
				new_line = true
			elsif iterator.to_s[1]
				string << " #{iterator}"
			else
				string << "  #{iterator}"
			end
			new_line_iterator += 1
			iterator += 1
		end
		string << "\n"
		string
	end

	def center_month_year
		"#{translate_month} #{year}".center(20).rstrip
	end

	def to_s
		<<EOS
#{center_month_year}
Su Mo Tu We Th Fr Sa
#{create_date_numbers_string}
EOS
	end
end