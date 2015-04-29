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

    def month_to_s_translate(m)
        month = Month.new(m,year)
        new_string = <<EOS
#{month.translate_month.center(20).rstrip}
Su Mo Tu We Th Fr Sa
#{month.create_date_numbers_string}
EOS
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

    def equalize_line_lengths(month1,month2,month3)
        m1lines = month1.lines.length
        m2lines = month2.lines.length
        m3lines = month3.lines.length
        month1 << "\n" if m1lines < m2lines || m1lines < m3lines
        month2 << "\n" if m2lines < m1lines || m2lines < m3lines
        month3 << "\n" if m3lines < m2lines || m3lines < m1lines
    end

    def combine_lines(month1,month2,month3)
        equalize_line_lengths(month1,month2,month3)
        string = ''
        m2lines = month2.lines
        m3lines = month3.lines
        month1.each_line.with_index do |line,index|
            string << line.chomp.ljust(22) << m2lines[index].chomp.ljust(22) << m3lines[index] if index != m2lines.length-1
        end
        string
    end

    def to_s
        str = ""
        str << year.to_s.rjust(33)
        str << "\n\n"
        month_array = create_month_array()
        month_array.each_slice(3) do |m|
            month_str = combine_lines(m[0],m[1],m[2])
            str << month_str
        end
        str
    end
end

