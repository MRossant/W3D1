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

    def my_reject(&prc)
        result = []
        i = 0
        while i < self.length
            result << self[i] if !prc.call(self[i])
            i += 1
        end
        result
    end
    
    def my_any?(&prc)
        i = 0
        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false
    end

    def my_all?(&prc)
        i = 0
        while i < self.length
            return false if !prc.call(self[i])
            i += 1
        end
        true
    end
end  


a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

    

