#1. Hours in a year

year = 1
days = year * 365
hours = days * 24
hours_a_year = hours * year

puts hours_a_year


#2. Minutes in a decade

minutes_decade = (year * 10) * (hours_a_year * 60)

puts minutes_decade

#3.My Age in seconds

age = 2013 - 1986
puts age * hours_a_year * 3600


# Fix Better Way to do this. 
puts (Time.now - Time.gm(1986,7,18,00,00))


# Author Age

age_in_sec = 1111 * 1000000
puts (age_in_sec / 3600) / hours_a_year
