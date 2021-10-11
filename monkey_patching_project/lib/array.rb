# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty? 
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum/self.length.to_f
    end

    def median
        return nil if self.empty?
        if self.length.odd?
            middle_index = self.length/2
            return self.sort[middle_index]
        else
            idx1 = self.length/2 - 1
            idx2 = self.length/2
            return (self.sort[idx1] + self.sort[idx2]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(v)
        count = 0
        self.each { |ele| count += 1 if ele == v }
        count
    end

    def my_index(v)
        self.each_with_index { |ele, i| return i if ele == v }
        nil
    end

    def my_uniq
        hash = {}
        self.each { |ele| hash[ele] = true }
        hash.keys
    end

    def my_transpose
        result = Array.new(self.length) {Array.new}

        self.each_with_index do |subar, idx1|
            subar.each_with_index do |ele, idx2|
                result[idx2] << ele
            end
        end
        result
    end
    
end
