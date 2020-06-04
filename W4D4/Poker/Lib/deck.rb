class Deck
    attr_reader :cards
    require "card"
    
    def initialize
        @cards = []
        setup 
    end
    

    def shuffle
        @cards = cards.shuffle
    end
    

private

    def setup
        (1..13).each {|i| cards << Card.new(i, :S)}
        (1..13).each {|i| cards << Card.new(i, :D)}
        (1..13).each {|i| cards << Card.new(i, :C)}
        (1..13).each {|i| cards << Card.new(i, :H)}  
    end
    

    
end