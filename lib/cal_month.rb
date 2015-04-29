require_relative 'cal_day'
require_relative 'cal_year'

class Month
    attr_reader :month,:year

    def initialize(month,year)
        @month = month
        @year = year
    end

    $translate_month_table = [nil,"January","February","March","April",
        "May","June","July","August","September","October","November","December"]
    #keys to find first week break point and opening spaces
    #determined by result of Zeller's Congruence found in Day class
    $find_month_day_break_point = [1,7,6,5,4,3,2]
    $opening_spaces = [18,0,3,6,9,12,15]

    def translate_month
        return $translate_month_table[month]
    end

    def find_days_in_month
        y = Year.new(year)
        if month == 4 || month == 6 ||
            month == 9 || month == 11
            return 30
        elsif month == 2 && y.leap?
            return 29
        elsif month == 2 && !y.leap?
            return 28
        else
            return 31
        end
    end

    def break_numbers_array(day_num)
        arr = []
        start_num = $find_month_day_break_point[day_num]
        5.times do |x|
            num = start_num + x*7
            arr.push(num)
        end
        arr.push(find_days_in_month())
    end

    def create_date_numbers_string
        string = ""
        d = Day.new(month,1,year)
        day_of_week = d.to_s
        num_arr = break_numbers_array(day_of_week)
        (1..find_days_in_month).each do |num|
            if num_arr.include?(num)
                string << num.to_s.rjust(2) << "\n"
            else
                string << num.to_s.rjust(2) << " "
            end
        end
        string.prepend(" " * $opening_spaces[day_of_week])
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