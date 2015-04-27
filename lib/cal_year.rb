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

	def create_last_line_spaces(new_str)
		str = ""
		l = (20 - (new_str.lines[new_str.lines.length-1].length-1)).to_i
		str.rjust(l)
	end

	def month_to_s_translate(m)
		month = Month.new(m,year)
		new_string = <<EOS
#{month.translate_month.center(20)}
Su Mo Tu We Th Fr Sa
#{month.create_date_numbers_string}
EOS
		# spaces = create_last_line_spaces(new_string)
		# new_string << spaces
		new_string
	end

	def create_month_array
		month_array = []
		(1..12).each do |monthNum|
			month = month_to_s_translate(monthNum)
			month_array.push(month)
		end
		month_array
	end

	def combine_lines(month1,month2,month3)
		string = ''
		m2lines = month2.lines
		m3lines = month3.lines
		month1.each_line.with_index do |line,index|
			string << line.chomp << '  ' << m2lines[index].chomp << '  ' << m3lines[index]
		end
		string
	end

	def to_s
		puts year.to_s.center(64)
		month_array = create_month_array()
		month_array.each_slice(3) do |m|
			month_str = combine_lines(m[0],m[1],m[2])
			print month_str
		end
	end
end

