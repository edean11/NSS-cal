# NSS-cal
Ruby Calendar App

#Objectives
Practice with Arrays, Hashes, and Strings
Develop the logic of a non-trivial algorithm
Programming to meet a (changing) specification

#Requirements
Your program must have tests. These test may be as high-level (integration tests) or as low-level (unit tests) as you wish. I highly recommend a mix of tests.
You may not use any of the built-in Ruby classes that provide date, time, or calendar functionality.
You may not use exec, Kernel, etc. to shell out to any Unix programs.
You should not use "magic" numbers.
You must commit your code at least once per day and push it to your github repository.
As a capstone project for the basic Ruby portion of the course, this should demonstrate your skills. Do not share code with your peers. You can help each other think about the problems, but don't help each other code.
Your program should accept any combination of months and years between 1800 and 3000.

#Suggested Implementation Order
You will find this (and all future) programming projects much easier if you take the time to break it down into smaller parts. I will suggest a breakdown that works well for me:

	*Implement Zeller's Congruence, with test for all of the special types of months/years.
	*Implement printing a month where the first day of the month is on a Sunday. For example, January 2012. This is the easiest type of month to print and can be thought of as a base case. For this, you can temporarily hardcode the assumption that the month will start on Sunday. Of course, you will use tests for this!
	*Combine the powers of your Zeller's Congruence (which will tell you the real first day of the month) with your basic month printing from step 2. Test the hell out of this!
	*After you feel good about that and have had your first milestone reviewed, combine the ability to print each individual month, to allow you to print an entire year. Hint: This is all about combining strings!

#Ruby Script

month = Month.new(ARGV[0],ARGV[1])
puts month.to_s

#Zeller's Congruence

h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
q is the day of the month
m is the month (3 = March, 4 = April, 5 = May, ..., 14 = February)
K the year of the century (year \mod 100).
J is the zero-based century (actually \lfloor year/100 \rfloor) For example, the zero-based centuries for 1995 and 2000 are 19 and 20 respectively (to not be confused with the common ordinal century enumeration which indicates 20th for both cases).
