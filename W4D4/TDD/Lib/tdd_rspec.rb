def my_uniq(array)
    count = Hash.new(0)
    array.each do |ele|
        count[ele] += 1
    end
    count.keys
end

def two_sum(array)
    result = []

    (0...array.length).each do |i|
        (0...array.length).each do |j|
            if (i < j) && (array[i] + array[j] == 0)
                result << [i,j]
            end
        end
    end
    result
end

def my_transpose(array)
    (0...array.length).map do |i|
        (0...array.length).map do |j|
            array[j][i]
        end
    end
end

def stock_picker(array)
    pairs = {}

    array.each_index do |idx1|
        (idx1 + 1...array.length).each do |idx2|
            if idx1 < idx2
                pairs[[idx1 + 1, idx2 + 1]] = array[idx2] - array[idx1]
            end
        end
    end
    pairs.key(pairs.values.max)
end

    

class Game
    #using pop with 3,2,1 setup 
    attr_reader :towers 

    def initialize(towers = [[3,2,1], [], []])
        @towers = towers
    end

    def valid_move?(start_pos, end_pos)
        return false if towers[start_pos].empty?
        return true if towers[end_pos].empty? || (towers[end_pos].last > towers[start_pos].last)
        towers[end_pos].last < towers[start_pos].last ? false : true
    end

    def move(start_pos, end_pos)
        if valid_move?(start_pos, end_pos)
            towers[end_pos] << towers[start_pos].pop
        else
            raise "Invalid Move!"
            sleep(1)
            # self.play
        end
    end

    def won?
        true if @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
    end

end