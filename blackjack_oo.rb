# coding: utf-8
#Black Jack OO version by Frank Wang

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
    puts "#{player.class}: #{player.cards} Total point #{total}"
    if total > 21 
      puts "#{player.class} busted!"
      exit
    elsif total == 21
      puts "#{player.class} is blackjack" 
      exit
    end
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
  #include FairPlay
  attr_accessor :deck

  def initialize
    suits = ["♠", "♥", "♦", "♣"]
    cards = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
    @deck = suits.product(cards).shuffle!
  end

  def pop
    @deck.pop
  end

end


class Game
  include FairPlay

  def intro(player)
    puts "Welcome to Las Vegas! #{player.name}"
    puts "...Dealing Cards..."
    sleep(1)
  end

  def game_on(dealer,player,deck)
    intro(player)
    #binding.pry
    player_hand(player,deck)
    dealer_hand(dealer,deck)
    compare(player,dealer)
  end

  def player_hand(player,deck)
    player.cards << deck.pop
    player.cards << deck.pop
    result(cal(player.cards),player)
    while player.total < 21
      puts "You want 1) hit or 2)stay?"
      operation = gets.chomp
      case operation
      when "1"
        player.cards << deck.pop
        player.total = cal(player.cards)
        result(player.total,player)
      when "2"
        puts "Stay"
        result(player.total,player)
        return
      end
    end
  end

  def dealer_hand(dealer,deck)
    dealer.cards << deck.pop
    dealer.cards << deck.pop
    while dealer.total < 17
      dealer.cards << deck.pop
      dealer.total = cal(dealer.cards)
      result(dealer.total,dealer)
    end 
  end

  def compare(player,dealer)
    if dealer.total > player.total
      puts "Dealer wins"
    elsif dealer.total < player.total
      puts "Player Win"
    end
  end
end

#The Game

dealer = Dealer.new("Jack","Junior")
player1 = Player.new("Frank",1000,10)
game = Game.new

deck = Cards.new
game.game_on(dealer,player1,deck)


