require "tdd_rspec"

describe "#my_uniq" do 
    let (:array) {[1, 2, 1, 3, 3]} 
    it "return an array with unique elements" do 
        expect(my_uniq(array)).to eq([1,2,3])
    end
end

describe "#two_sum" do 
    let (:array) {[-1, 0, 2, -2, 1]}
    it "should return a 2D array with indices of pairs that sum to zero" do
        expect(two_sum(array)).to eq([[0,4],[2,3]])
    end
end


describe "#my_transpose" do 
    let (:matrix) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
    it "should return a 2d array with row and column indices flipped" do 
        expect(my_transpose(matrix)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end

describe "#stock_picker" do
    let (:array) {[8, 1, 4, 6, 9, 2]}

    it "should return an array with 2 elements" do
        expect(stock_picker(array).length).to eq(2)
    end
    it "should return a 1st element smaller than the second element" do
        expect(stock_picker(array).first).to be < (stock_picker(array).last)
    end

    it "should return a pair of days from which the stock can provide max profit" do
        expect(stock_picker(array)).to eq([2,5])
    end

end
# (towers = [[3,2,1], [], []])
describe Game do 
    # let(:) {double("hanoi")}
    let(:hanoi) {Game.new}
    describe "#initialize" do
        it "should create a 2d array with elements that are arrays to represent the pegs" do
            expect(hanoi.towers.all?{|peg| peg.is_a?(Array)}).to be true
            expect(hanoi.towers.length).to eq(3)
        end
    end

    describe "#valid_move?" do 
        it "should return true if end position is an empty array" do 
            expect(hanoi.valid_move?(0,1)).to be true
            expect(hanoi.valid_move?(0,2)).to be true
        end
        it "should return false if starting position is an empty array" do 
            expect(hanoi.valid_move?(1,0)).to be false
            expect(hanoi.valid_move?(2,0)).to be false
        end
        it "prevents user from placing larger disk on smaller disk" do 
            hanoi.move(0,1)
            expect(hanoi.valid_move?(0,1)).to be false
        end
        it "should return true if user puts a smaller peg on a larger peg" do 
            hanoi.move(0,1)
            expect(hanoi.valid_move?(1,0)).to be true
        end
    end

    describe "#move" do
        it "should move a smaller disk onto a bigger disk" do
            hanoi.move(0,1)
            expect(hanoi.towers).to eq([[3,2], [1], []])
        end
        it "should not move a larger disk onto a smaller disk" do 
            hanoi.move(0,1)
            expect{hanoi.move(0,1)}.to raise_error("Invalid Move!")
        end
    end
    
    describe "#win?" do #([[], [1], [3,2]])
        let(:winner) {Game.new([[], [1], [3,2]])}
        it "should return true if user wins or not" do
            winner.move(1,2)
            expect(winner.won?).to be true
        end

        it "should return false if user has not won" do
            expect(hanoi.won?).to be_falsy
        end
    end
end