nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts "Task 1"
nums.each do |num|
	puts num
end

puts "Task2"

nums.each do |num|
	puts num if num > 5
end

puts "Task3"

nums_odd = nums.select {|num| num.odd?}

puts nums_odd

puts "Task 4"

nums.push(11)
nums.insert(0,0)

puts nums

puts "Task 5"

nums.pop

nums.push(3)

puts nums

puts "Task 6"

# not sure why Task 6 does not work

nums.delete_if { |num| num == num }

puts nums

puts "Task 7"

puts "Array is collection of elements in order, Hash is a collection of key vs value elements."

puts "Task 8"

#ruby 1.8 Hash

hash_18 = { :a => 1, :b => 2, :c => 3, :d => 4 }

puts hash_18

#ruby 1.9 Hash

hash_19 = { a:1, b:2, c:3, d:4 }

puts hash_19

puts "Task 9"

puts hash_19[:b]

puts "Task 10"

hash_19[:e] = 5

puts hash_19

puts "Task 13"

hash_19.delete_if { |k,v| v <= 3.5}

puts hash_19

puts "Task 14"

hash_19.to_a

puts hash_19

puts "Task 15"
puts "sort method from Array class, sorting is very fast and easy"


