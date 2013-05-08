#Full name greeting

def greeting
	puts "Enter your first name"
	first_name = gets.chomp
	puts "Enter your middle name"
	middle_name = gets.chomp
	puts "Enter your last name"
	last_name = gets.chomp

	puts "Welcome #{first_name} #{middle_name} #{last_name}"
end

greeting

#Bigger, better favorite number

def fav_num
	puts "Enter your favorite number"
	fav_num = gets.chomp.to_i
	unless fav_num.is_a? Integer
		puts "Pls enter Integer"
		fav_num = gets.chomp.to_i
	end
	bigger_num = fav_num + 1

	puts "my number is better #{bigger_num} than your #{fav_num}"
end

fav_num
