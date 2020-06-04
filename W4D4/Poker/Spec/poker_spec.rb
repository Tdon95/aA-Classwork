require "card"
require "deck"
require "rspec"

describe Card do 
    let(:card) {Card.new(3, :S)}
    describe "#initialize" do 
        
        it "should create a card instance with a value beteen (1,13)" do
            expect(card.val).to eq(3)
        end
        it "should create a card instance with one of 4 valid suits" do 
            expect(card.suit).to eq(:S)
        end
    end
end

describe Deck do
    let(:deck){Deck.new}
    describe "#initialize" do
        it "should call the setup method to generate a full 52 card deck" do 
            expect(deck.cards).to be_a(Array)
            expect(deck.cards.length).to eq(52)
        end
    end
    describe "#shuffle" do
        it "should return a shuffled deck" do 
            expect(deck.shuffle).not_to eq(deck) 
        end
    end
end