#Improved ask method

def ask_methd que
	while true
		puts que
		answer = gets.chomp.downcase
		case answer
		when answer == 'yes'
			return true
		when answer == 'no'
			return false
		else 
			puts "Please enter yes or no answer!"
		end
	end
end

#ask_methd("What do you want?")

#Old School Roman numerals


def old_roman_numeral num
	raise 'Must use positive integer' if num <= 0
	roman = ''
	puts 'M' * (num / 1000)
	puts 'D' * (num % 1000 / 500)
	puts 'C' * (num % 500 / 100)
	puts 'L' * (num % 100 / 50)
	puts 'X' * (num % 50 / 10)
	puts 'V' * (num % 10 / 5)
	puts 'I' * (num % 5 / 1)
	roman
end

old_roman_numeral(1999)


