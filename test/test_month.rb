require_relative 'helper'
require_relative '../lib/cal_month'
require_relative '../lib/cal_year'

class TestMonth < Minitest::Test
	def test_initializing_a_month_saves_values
		m = Month.new(05,2015)
		assert_equal 05,m.month
		assert_equal 2015,m.year
	end

	def test_to_s_on_jan_2012
		m = Month.new(01,2012)
		expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected, m.to_s
	end

	def test_to_s_on_jan_2017
		m = Month.new(01,2017)
		expected = <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected, m.to_s
	end

	def test_to_s_on_march_2015
		m = Month.new(03,2015)
		expected = <<EOS
     March 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected, m.to_s
	end

	def test_translate_month_july
		m = Month.new(07,2012)
		expected = "July"
		assert_equal expected, m.translate_month
	end

	def test_translate_month_jan
		m = Month.new(01,2012)
		expected = "January"
		assert_equal expected, m.translate_month
	end

	def test_find_days_in_month_july_2012
		m = Month.new(07,2012)
		expected = 31
		assert_equal expected, m.find_days_in_month
	end

	def test_find_days_in_month_june_1900
		m = Month.new(06,1900)
		expected = 30
		assert_equal expected, m.find_days_in_month
	end

	def test_find_days_in_month_feb_2012
		m = Month.new(02,2012)
		expected = 29
		assert_equal expected, m.find_days_in_month
	end

	def test_find_days_in_month_feb_2011
		m = Month.new(02,2011)
		expected = 28
		assert_equal expected, m.find_days_in_month
	end

	def test_create_date_numbers_string_oct_1850
		m = Month.new(10,1850)
		expected = "       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
"

		assert_equal expected, m.create_date_numbers_string
	end

	def test_to_s_on_may_2014
		m = Month.new(05,2014)
		expected = <<EOS
      May 2014
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
		assert_equal expected, m.to_s
	end

end