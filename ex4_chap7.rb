# 99 Bottles of Beer on the Wall

def composor
	beer_start = 99
	beer_current = 1

	while beer_current < beer_start
		puts "#{beer_current} bottles of beer on the wall, #{beer_current} bottles of beer."
		puts "Take one down, pass it around, #{beer_current} bottles of beer on the wall."
		beer_current += 1
	end
end

composor

# Deaf Grandma

def grandma_says
	puts "What do you want to say to Grandma?"
	msg = gets.chomp
	while msg
		puts "HUH?! SPEAK UP, SONNY!"
		puts "Say it again?"
		msg = gets.chomp
		year = rand(1930..1950)
		if msg.downcase!
			puts "NO, NOT SINCE #{year}!"
		end
		if msg =='bye'
			break
		end		
	end
end

grandma_says