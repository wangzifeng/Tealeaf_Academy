#Angry Boss

puts "What do you want?!"

iwish = gets.chomp

def angry_boss_says(msg)
	puts "WTF #{msg}? you are fired!".upcase
end

angry_boss_says(iwish)

#Table of content

def table_generator(line_width)
	puts "Table of content".center(line_width)
	puts "Chapter 1: Getting Started".ljust(line_width/2) << "page 1".rjust(line_width/2)
	puts "Chapter 2: Numbers".ljust(line_width/2) << "page 9".rjust(line_width/2)
	puts "Chapter 3: Letters".ljust(line_width/2) << "page 13".rjust(line_width/2)
end

table_generator(100)


