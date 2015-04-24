require_relative 'helper'
require_relative '../lib/cal_year'

class TestCheersIntegration < MiniTest::Test
	def test_help_message
		output = `./cal.rb`
		expected = <<EOS
Date not acceptable format/range
./cal.rb [01-12] [1800-3000]
EOS
		assert_equal expected, output
	end

	def test_arguments_with_valid_month_num_leading_zero
		output = `./cal.rb 01 2012`
		expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected, output
	end

	def test_arguments_with_valid_month_num
		output = `./cal.rb 3 2015`
		expected = <<EOS
     March 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
		assert_equal expected, output
	end

	def test_reg_leap_year
		output = `./cal.rb 02 2012`
		expected = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS
		assert_equal expected, output
	end

	def test_century_leap_year
		output = `./cal.rb 02 3000`
		expected = <<EOS
   February 3000
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
		assert_equal expected, output
	end

	def test_400_leap_year
		output = `./cal.rb 02 2000`
		expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
		assert_equal expected, output
	end

	def test_invalid_min_date
		output = `./cal.rb 02 1750`
		expected = <<EOS
Date not acceptable format/range
./cal.rb [01-12] [1800-3000]
EOS
		assert_equal expected, output
	end

	def test_invalid_max_date
		output = `./cal.rb 02 3500`
		expected = <<EOS
Date not acceptable format/range
./cal.rb [01-12] [1800-3000]
EOS
		assert_equal expected, output
	end

	def test_valid_min_date
		output = `./cal.rb 01 1800`
		expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_valid_max_date
		output = `./cal.rb 12 3000`
		expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_invalid_argument_month_name
		output = `./cal.rb Feb 2000`
		expected = <<EOS
Date not acceptable format/range
./cal.rb [01-12] [1800-3000]
EOS
		assert_equal expected, output
	end

	def test_invalid_argument_order
		output = `./cal.rb 2000 02`
		expected = <<EOS
Date not acceptable format/range
./cal.rb [01-12] [1800-3000]
EOS
		assert_equal expected, output
	end

	def test_six_week_month
		output = `./cal.rb 03 2014`
		expected = <<EOS
     March 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS
		assert_equal expected, output
	end

	def test_month_3
		output = `./cal.rb 03 2000`
		expected = <<EOS
     March 2000
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_month_4
		output = `./cal.rb 04 2001`
		expected = <<EOS
     April 2001
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
		assert_equal expected, output
	end

	def test_month_5
		output = `./cal.rb 05 2002`
		expected = <<EOS
      May 2002
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_month_6
		output = `./cal.rb 06 2003`
		expected = <<EOS
     June 2003
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
		assert_equal expected, output
	end

	def test_month_7
		output = `./cal.rb 07 2004`
		expected = <<EOS
     July 2004
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_month_8
		output = `./cal.rb 08 2005`
		expected = <<EOS
    August 2005
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_month_9
		output = `./cal.rb 09 2006`
		expected = <<EOS
   September 2006
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30

EOS
		assert_equal expected, output
	end

	def test_month_10
		output = `./cal.rb 10 2007`
		expected = <<EOS
    October 2007
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
		assert_equal expected, output
	end

	def test_month_11
		output = `./cal.rb 11 2008`
		expected = <<EOS
   November 2008
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30

EOS
		assert_equal expected, output
	end

	def test_month_12
		output = `./cal.rb 12 2009`
		expected = <<EOS
   December 2009
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS
		assert_equal expected, output
	end

end