require 'byebug'

class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i]) # { |num| num > 1 }
            i += 1
        end
        # debugger
        self
    end

    def my_select(&prc)
        result = []
        i = 0
        while i < self.length
            result << self[i] if prc.call(self[i])
            i += 1
        end

        result
    end
    
    
end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

