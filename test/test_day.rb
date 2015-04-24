require_relative 'helper'
require_relative '../lib/cal_day'

class TestDay < Minitest::Test
	def test_initializing_a_day_saves_values
		m = Day.new(05,25,2015)
		assert_equal 05,m.month
		assert_equal 25,m.day
		assert_equal 2015,m.year
	end

	def test_day_to_s_for_beginning_of_month_may_01_2014
		m = Day.new(05,01,2014)
		expected = 'Th'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_jan_01_2012
		m = Day.new(01,01,2012)
		expected = 'Su'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_jan_01_2013
		m = Day.new(01,01,2013)
		expected = 'Tu'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_jan_01_2015
		m = Day.new(01,01,2015)
		expected = 'Th'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_jan_01_2016
		m = Day.new(01,01,2016)
		expected = 'Fr'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_feb_01_2016
		m = Day.new(02,01,2016)
		expected = 'Mo'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_feb_01_2017
		m = Day.new(02,01,2017)
		expected = 'We'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_beginning_of_month_july_01_2009
		m = Day.new(7,01,2009)
		expected = 'We'
		assert_equal expected,m.to_s
	end

	def test_day_to_s_for_random_day_november_14_2000
		m = Day.new(11,14,2000)
		expected = 'Tu'
		assert_equal expected,m.to_s
	end
end