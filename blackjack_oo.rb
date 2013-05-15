# coding: utf-8
#Black Jack OO version

require "pry"

module Game
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

end


class CasinoBoys;
	def has_cards
		@has_cards = []
	end

	def has_total
		@total = 0
	end
end


#Dealer
class Dealer < CasinoBoys
	def initialize(name,level)
		@name = name
		@level = level
	end
end

#Player

class Player < CasinoBoys
	attr_accessor :ante, :fund

	def initialize(name, fund, ante)
		@name = name
		@fund = fund
		@ante = ante
	end



end

#The Cards

class Cards
	include Game
	attr_accessor :deck

	def initialize
		suits = ["♠", "♥", "♦", "♣"]
		cards = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
		@deck = suits.product(cards)
	end

	def hit
		binding.pry
		player_card = []
		player_card << @deck.pop
		player_card
	end

	def stay
		puts "Stay"
	end
end

#The Game



dealer1 = Dealer.new("Jack","Junior")

player1 = Player.new("Frank",1000, 10)

deck = Cards.new



player1.has_cards << deck.hit

p player1.has_cards

