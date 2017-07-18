def print_hang_man(num_failures)
	case num_failures
	when 0
		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     "
  		puts "\t\t    |    "
  		puts "\t\t    |   "
  		puts "\t\t----+---------"
	when 1
		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."		
  		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     O"
  		puts "\t\t    |    "
  		puts "\t\t    |   "
  		puts "\t\t----+---------"
  	when 2
  		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
  		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     O"
  		puts "\t\t    |     |"
  		puts "\t\t    |   "
  		puts "\t\t----+---------"
  	when 3
  		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
  		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     O"
  		puts "\t\t    |     |\\"
  		puts "\t\t    |   "
  		puts "\t\t----+---------"
  	when 4
  		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
  		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     O"
  		puts "\t\t    |    /|\\"
  		puts "\t\t    |   "
  		puts "\t\t----+---------"
  	when 5
  		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
  		puts "\t\t    +-----+"
  		puts "\t\t    |     "
  		puts "\t\t    |     O"
  		puts "\t\t    |    /|\\"
  		puts "\t\t    |   _/"
  		puts "\t\t----+---------"
  	when 6
  		puts "Press Ctrl+C [^C] or Ctrl+D [^D] to --EXIT-- the game."
  		puts "\t\t    +-----+"
  		puts "\t\t    |     |"
  		puts "\t\t    |     O"
  		puts "\t\t    |    /|\\"
  		puts "\t\t    |   _/ \\_"
  		puts "\t\t----+---------"
  	end  			
end 

def get_random_words
	bank = ["jazz", "buzz", "abruptly", "banjo", "curacao", "galaxy", "ivory", "jiujitsu", "khaki", "luxury", "jackpot", "matrix", "marquis", "schnapps", "scratch", "wizard", "yachtsman", "yummy", "zephyr", "zombie", "zipper", "zodiac", "syndrome", "sphinx", "pixel", "voyeurism", "topaz", "rhythm","megahertz", "oxygen", "subway", "vodka", "unzip", "walkway"]
	return bank.shuffle
end

def get_current_word
	list = get_random_words
    return list[0]
end

def print_guessed_letters(word_to_guess, guessed_letters) 
	for letter in word_to_guess.each_char
		if guessed_letters.include? letter
			print "#{letter} "
		else
			print "_ "
		end
	end
	
end

def print_wrong_letters(wrong_letters) 
	puts "\t\t\tWrong letters: #{wrong_letters}"
end

def winner?(word_to_guess, guessed_letters)
	count = 0
	for letter in word_to_guess.each_char
		if guessed_letters.include? letter
			count += 1
		end
	end
	return count == word_to_guess.length
end

system ("clear")
puts "Tutorial:"
puts "Welcome to Hang-Man,"
print "It's a single player game where you need to find out a hidding word that would save yourself from being hanged.\n"
print "The way you do this is very simple. The computer will choose a word and will output the word hidden"
print " represented by the spaces of each letter.\n"
print "Lets say that the secret word is \"sun\", then output should be like \"_ _ _\". \n"
print "With this information you will start guessing the letters. If the letter entered is in the hidden word, the program will unveil the letter(s) that are in the word.\n"
print "If not, you get a strike that brings you closer to loose. The program will draw a peice of a human body at the post when would be hanged.\n"
print "The program will help you by giving you a list of the wrong letters, because if you repeat the wrong letter it will be a new strike.\n"
print "Keep in mind that in any moment if you feel that you know the word you could put all the words you are missing at one.\n"
print "But if you are wrong, each letter will count as wrong.\n"
print "We recommend you to guess letter by letter\n"
print "Do you want to play? [y/N]"
input = gets.chomp.downcase
unless input == "y"
	system("clear")
	exit_game = true
end
word_to_guess = get_current_word
guessed_letters = []
wrong_letters = []

while exit_game != true
	system ("clear")
	
	print_hang_man(wrong_letters.length)
	print_guessed_letters(word_to_guess, guessed_letters)
	print_wrong_letters(wrong_letters)
	
	
	print "\t\tEnter your best guess: "
	
	input_text = gets.chomp.downcase
	
	for letter in input_text.each_char
		if word_to_guess.include? letter
			guessed_letters.push(letter)
		else
			wrong_letters.push(letter)
		end
	end
	system ("clear")
	print_hang_man(wrong_letters.length)
	print_guessed_letters(word_to_guess, guessed_letters)
	print_wrong_letters(wrong_letters)

	if wrong_letters.length > 5
		puts "You Lost!"
		print "Continue playing [y/N]: "
		input_to_continue = gets.chomp
		if input_to_continue.downcase == "y"
			word_to_guess = get_current_word
			guessed_letters = []
			wrong_letters = []
			exit_game = false
		else
			system("clear")
			exit_game = true
		end
		
	elsif winner?(word_to_guess, guessed_letters)
		puts "You Win!"
		print "Continue playing [y/N]: "
		input_to_continue = gets.chomp
		if input_to_continue.downcase == "y"
			word_to_guess = get_current_word
			guessed_letters = []
			wrong_letters = []
			exit_game = false
		else
			system("clear")
			exit_game = true
		end			
	end

end