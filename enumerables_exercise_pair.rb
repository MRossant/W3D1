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

    def my_flatten
        answer = []
        self.each do |el|
            if !el.is_a?(Array)
                answer << el
            else
                el.each { |inst| answer << inst }
            end
        end

        if answer.all? {|el| !el.is_a?(Array)}
            return answer
        else
            answer.my_flatten
        end
    end
end  


# a = [1, 2, 3]
# # p a.my_any? { |num| num > 1 } # => true
# # p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

    

