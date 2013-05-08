# Array Sorting

def cool_array
	puts "Type as many words as you could"

	words_array = []
	while true
		words = gets.chomp
		words_array << words
		if words.empty? #to check if it's empty
			break
		end
	end
	sorted = words_array.sort

	sorted.each do |word|
		puts word
	end
end

cool_array

# Table of content

def table_content(line_height)

	content_array = ['Table of content', 'Chapter 1: Getting Started', 
		'page 1','Chapter 2: Numbers','page 9','Chapter 3: Letters','page 13']

	puts content_array[0].center(line_height)
	puts content_array[1].ljust(line_height/2) + content_array[2].ljust(line_height/2)
	puts content_array[3].ljust(line_height/2) + content_array[4].ljust(line_height/2)
	puts content_array[5].ljust(line_height/2) + content_array[6].ljust(line_height/2)

end

table_content(100)