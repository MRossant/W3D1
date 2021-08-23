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

    def my_zip(*args)
        result = []
        (0...self.length).each do |i|
            combine = []
            combine << self[i]
            args.each.with_index do |arg, arg_index|
                combine << arg[i]
            end
            result << combine
        end
        result
    end

    def my_rotate(num=1)
        self.rotate(num)
    end

    
end  


# # a = [1, 2, 3]
# # # p a.my_any? { |num| num > 1 } # => true
# # # p a.my_any? { |num| num == 4 } # => false
# # p a.my_all? { |num| num > 1 } # => false
# # p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]    

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]