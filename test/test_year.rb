require_relative 'helper'
require_relative '../lib/cal_year'

class TestYear < Minitest::Test
	def test_initializing_a_year_saves_value
		y = Year.new(2015)
		assert_equal 2015,y.year
	end

	def test_non_leap_year
		y = Year.new(2011)
		assert_equal false,y.leap?
	end

	def test_reg_leap_year
		y = Year.new(2012)
		assert_equal true,y.leap?
	end

	def test_century_leap_year
		y = Year.new(3000)
		assert_equal false,y.leap?
	end

	def test_400_leap_year
		y = Year.new(2000)
		assert_equal true,y.leap?
	end

	def test_removing_year_from_month_string_jan_2012
		y = Year.new(2012)
		puts y.to_s
		expected = <<EOS
      January       
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected,y.month_to_s_translate(1)
	end
end