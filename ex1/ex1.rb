$p1_question_array = []
$p1_answer_array = []
$p2_answer_array = []
$player_names = []
$played = false
$question = 'question'

def init()
	if not $played
		welcome()
	else
		play_again()
	end
end

def welcome()
	puts 'Welcome to the Newly Pair Game. Would you like to view instructions? (Y/N)'
	$instructions = gets.chomp
	if $instructions == 'Y' || $instructions == 'y'
		instructions()
	elsif $instructions == 'N' || $instructions == 'n'
		player_one()
	else
		wrong_input()
		welcome()
	end
end

def instructions()
	puts 'The Newly Pair game is for two players. The first player secretly chooses three personal questions. The second player then attempts to answer each question correctly. Is Player One prepared to begin? (Y/N)'
	start = gets.chomp
	if start == 'Y' || start == 'y'
		player_one()
	elsif start=='N' || start=='n'
		puts 'Take your time.'
		instructions()
	else
		wrong_input()
		instructions()
	end
end

def wrong_input()
	puts 'I\'m sorry, I didn\'t understand that command. Please answer Y or N.'
end

def play_again()
	puts 'Do you want to play again? (Y/N)'
	$play = gets.chomp
	if $play == 'Y' || $play == 'y'
	player_one()
	elsif $play == 'N' || $play == 'n'
		puts 'Cool. Bye then.'
	else
		wrong_input()
		play_again()
	end
end

def player_one()
	puts 'Welcome, Player One. Tell Player Two to go run away and hide in a corner. (S)he shouldn\'t be able to see the questions and answers you write down.'
	puts 'What is your name?'
	$player_names = []
	name = gets.chomp
	$player_names.push(name)
	counter = 0
	$p1_question_array = []
	while counter <= 2
		$question_count = $p1_question_array.length + 1
		random_feedback = rand($question_feedback.length)
		if $question_count == 1
			puts 'Okay, ' + $player_names[0].capitalize + ', what personal question would you like Player 2 to try to answer? (' + $question_count.to_s + ' of 3)'
		else
			puts $question_feedback[random_feedback] + ' What\'s another personal question you\'d like Player 2 to try to answer? (' + $question_count.to_s + ' of 3)'
		end
		question = gets.chomp
		$p1_question_array.push(question)
		puts 'And what is the correct answer to question ' + $p1_question_array.length.to_s + '?'
		answer = gets.chomp
		$p1_answer_array.push(answer)
		counter += 1
	end
	player_one_done()
end

$question_feedback = ['What a great Q!', 'Sassy Q!', 'Now that\'s a Q you don\'t see every day!', 'Incredible Q!', 'Dyno-mite Q!', 'You\'ve done this before, haven\'t you?']

def player_one_done()
	puts 'Congrats Player One. You\'re all done! Type anything to continue, and then tell Player Two to rejoin you.'
	$continue = gets.chomp
	if $continue.length != 0
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		player_two()
	else
		player_one_done()
	end
end

def player_two()
	puts 'Welcome, Player 2. ' + $player_names[0].capitalize + ' has input some secret questions. Let\'s get started.'
	counter_two = 0
	points = 0
	while counter_two <= 2
		questions_remaining = $p1_question_array.length - counter_two - 1
		puts $p1_question_array[counter_two]
		answer = gets.chomp
		$p2_answer_array.push(answer)
		if $p1_answer_array[counter_two].to_s.downcase == $p2_answer_array[counter_two].to_s.downcase
			points += 1
			if questions_remaining > 1
				puts 'Congratulations! You scored a point! Your running total is ' + points.to_s + ' points! There are ' + questions_remaining.to_s + ' questions left.'
			elsif questions_remaining == 1
				puts 'Congratulations! You scored a point! Your running total is ' + points.to_s + ' points! There is ' + questions_remaining.to_s + ' question left.'
			else
				puts 'Congratulations! You scored a point!'
			end
		else
			puts 'You don\'t know your pair at all, do you? You don\'t even know how wrong that answer was.'
		end
		counter_two += 1
	end
	puts 'All done! Your final score was ' + points.to_s + ' points out of ' + $p1_question_array.length.to_s + '.'
	$played = true
	init()
end

init()
