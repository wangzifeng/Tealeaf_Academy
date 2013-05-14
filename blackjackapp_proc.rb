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

def show_cards(cards, person)
	puts "#{person} Cards"
	puts "#{cards}"
end

def show_result(dealer_total, player_total)
	if dealer_total > 21 && player_total > 21
		puts "Dealer and player both busted!"
	elsif dealer_total > 21
		puts "Dealer busted!"
	elsif player_total > 21
		puts "Player busted"	
	elsif dealer_total == 21
		puts "Dealer is blackjack"	
	elsif player_total == 21
		puts "Player is blackjack, player wins" 
	end

	puts "Dealer: Total point #{dealer_total}"
	puts "Player: Total point #{player_total}"
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

show_cards(dealer_card,"Dealer")
puts "Dealer Total:"
puts dealer_total

show_cards(player_card,"Player")
puts "Player Total:"
puts player_total


while player_total < 21 && dealer_total < 21
	puts "You want 1) hit or 2)stay? Enter digit"
	operation = gets.chomp.to_i
	case operation
	when 1
		dealer_card << card_shuffle.pop
		player_card << card_shuffle.pop
		dealer_total = cal(dealer_card)
		player_total = cal(player_card)
		show_cards(dealer_card)
		show_cards(player_card)
		show_result(dealer_total,player_total)
		
	when 2
	  dealer_total = cal(dealer_card)
		player_total = cal(player_card)
		show_cards(dealer_card)
		show_cards(player_card)
		show_result(dealer_total,player_total)
		break
	else
		puts "pls enter your choice in digit"
	end
end





