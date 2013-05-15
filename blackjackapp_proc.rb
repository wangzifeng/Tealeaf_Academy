 # coding: utf-8

def cal(cards)
	arr = cards.map { |v| v[1]}

	total = 0

	arr.each do |v|
		if v == "A"
			total += 11
		elsif v.to_i == 0
			total += 10
		else
			total += v.to_i
		end
	end


	arr.select { |x| x == "A"}.count.times do
		total -= 10 if total > 21
	end

	total
end

def result(total, player)
	if total > 21 
		puts "#{player} busted!"
		exit
	elsif total == 21
		puts "#{player} is blackjack"	
		exit
	end
	puts "#{player}: Total point #{total}"
end


suits = ["♠", "♥", "♦", "♣"]
cards = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]

deck = suits.product(cards)

card_shuffle = deck.shuffle

dealer_card = []
player_card = []

dealer_card << card_shuffle.pop
player_card << card_shuffle.pop
dealer_card << card_shuffle.pop
player_card << card_shuffle.pop

dealer_total = cal(dealer_card)
player_total = cal(player_card)

#show cards

puts "Welcome to Las Vegas!"
puts "Please enter your name"

name = gets.chomp

puts "Welcome #{name}, enjoy the game!"
puts "...Dealing Cards..."
sleep(1)

puts "#{dealer_card}"
puts "Dealer Total:"
puts dealer_total

puts "#{player_card}"
puts "Player Total:"
puts player_total

#Player Hand

while player_total < 21 
	puts "You want 1) hit or 2)stay?"
	operation = gets.chomp.to_i
	case operation
	when 1
		player_card << card_shuffle.pop
		player_total = cal(player_card)
		puts "Your total is #{player_total}"
		result(player_total, "Player")
	when 2
		puts "Stay"
		break
	end
end


#Dealer Hand

while dealer_total < 17
	dealer_card << card_shuffle.pop
	dealer_total = cal(dealer_card)
	result(dealer_total, "Dealer")
end

if dealer_total > player_total
	puts "Dealer wins"
elsif dealer_total < player_total
	puts "player Win"
end

exit




