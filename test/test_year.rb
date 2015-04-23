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
end