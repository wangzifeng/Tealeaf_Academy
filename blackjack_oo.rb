# coding: utf-8
#Black Jack OO version

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


class CasinoBoys
	include Game

	def hit(cards)
		player_card = []
		player_card << cards.pop
		player_total = cal(player_card)
		puts "Total is #{player_total}"
	end

	def stay

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
	attr_accessor :deck
	def initialize
		suits = ["♠", "♥", "♦", "♣"]
		cards = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
		@deck = suits.product(cards)
	end
end

#The Game



dealer1 = Dealer.new("Jack","Junior")

player1 = Player.new("Frank",1000, 10)

deck = Cards.new

player1.hit(deck)




