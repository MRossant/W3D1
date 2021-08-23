require 'byebug'

class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i]) # { |num| num > 1 }
            i += 1
        end
        debugger
        self
    end

    def my_select(&prc)
        result = []
        i = 0
        while i < self.length
            result << self[i] if self.my_each(&prc) # returns array
            i += 1
        end

        result
    end
end

puts "making some changes here"

