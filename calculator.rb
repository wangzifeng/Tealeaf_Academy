require 'pry'

puts "Please enter 1st number"

num1 = gets.chomp

puts "Please enter 2rd number"

num2 = gets.chomp

puts "So what do you want to do?"

puts "1. plus operation 2. minus operation 3. divide operation 4. multiply operation"

operation = gets.chomp

binding.pry

case operation
when "1"
	puts result = num1.to_i + num2.to_i
when "2"
	puts result = num1.to_i - num2.to_i
when "3"
	puts result = num1.to_f / num2.to_f
when "4"
	puts result = num1.to_i * num2.to_i
else
	puts "Please input operation code!"
end


