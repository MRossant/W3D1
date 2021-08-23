require 'byebug'

class Array
    def my_each(&prc)
        2.times {|el| prc.call(el)}
    end
end

puts "making some changes here"

