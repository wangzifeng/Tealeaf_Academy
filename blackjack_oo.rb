# coding: utf-8
#Black Jack OO version

require "pry"

module FairPlay

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
	attr_accessor :cards, :total, :name

	def initialize(name)
		@name = name
		@cards = []
		@total = 0
	end
end


#Dealer
class Dealer < CasinoBoys
	def initialize(dealer_name, level)
		super(dealer_name)
		@level = level
	end
end

#Player

class Player < CasinoBoys
	attr_accessor :fund, :ante

	def initialize(player_name, fund, ante)
		super(player_name)
		@fund = fund
		@ante = ante
	end

end

#The Cards

class Cards
	include FairPlay
	attr_accessor :deck

	def initialize
		suits = ["♠", "♥", "♦", "♣"]
		cards = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
		@deck = suits.product(cards)
	end

	def shuffle
		@deck.shuffle!
	end

	def pop
		@deck.pop
	end

end


class Game
	include FairPlay

	def intro(player)
		puts "Welcome! #{player.name}"
	end

	def game_on(player,deck)
		intro(player)
		player.cards << deck.pop
		player.cards << deck.pop
		while player.total < 21
			binding.pry
			puts "You want 1) hit or 2)stay?"
			operation = gets.chomp.to_i
			case operation
			when "1"
				player.total = cal(player.cards)
				puts "Your total is #{player.total}"
			when "2"
				puts "Stay"
				break
			end
		end
	end
end

#The Game

dealer = Dealer.new("Jack","Junior")
player1 = Player.new("Frank",1000,10)
game = Game.new

deck = Cards.new.shuffle
game.game_on(player1,deck)


