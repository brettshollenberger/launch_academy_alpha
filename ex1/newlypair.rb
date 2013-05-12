class Game
  attr_accessor :p1, :p2, :first_time, :first_question, :question_list, :question_array, :score

  def initialize()
    @first_time = 0
    @first_question = 0
    @p1, @p2 = welcome
    @question_list = {}
    @question_array = []
    @question_list, @question_array = write_questions
    @score = 0
    answer_questions
  end

  def play_again
    puts "Would you like to play again?"
    play = make_choice
    if play
      initialize
    elsif !play
      return
    else
      puts "Sorry, I couldn't understand your input. Try again."
      play_again
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def make_choice(input=gets.chomp)
    if input =~ /^[yY]/
      return true
    elsif input =~ /^[nN]/
      return false
    else
      return 'unparsable'
    end
  end

  def welcome
    self.first_time += 1
    if first_time == 1
      clear_screen
    end
    puts 'Welcome to the Newly Pair Game. Would you like to read instructions?'
    instructions = make_choice
    if instructions == 'unparsable'
      clear_screen
      puts "Sorry, I didn't understand your answer. Please answer yes or no."
      welcome
    elsif instructions
      return read_instructions(instructions)
    else
      return get_names(instructions)
    end
  end

  def read_instructions(instructions)
    clear_screen
    puts "The Newly Pair Game is for two players. Player One enters personal questions, and Player Two attempts to answer them correctly."
    return get_names(instructions)
  end

  def get_names(instructions)
    if !instructions
      clear_screen
    end
    puts "Let's start by getting your names. What is Player One's name?"
    p1 = gets.chomp.capitalize
    puts "\e[H\e[2J"
    puts "And what is Player Two's name?"
    p2 = gets.chomp.capitalize
    if p1 != p2
      return p1, p2
    else
      clear_screen
      puts "Sorry, this game is for two players with different names. Find a new friend and try again."
      get_names
    end
  end

  def write_questions
    clear_screen
    self.first_question += 1
    if self.first_question == 1
      puts "Welcome, #{p1}. Tell #{p2} to leave for a moment."
      puts "What's the first question you'd like #{p2} to try to answer?"
    else
      puts "If you'd like to ask another question, write it below. Otherwise, enter nothing."
    end
    question = gets.chomp.capitalize
    if question[-1] != '?'
      question.insert(-1, '?')
    end
    if question.length == 1
      question_list.each do |k, v|
        question_array.push(k)
      end
      question_array.shuffle!
      return question_list, question_array
    else
      puts "And what is the answer to the question, '#{question}'"
      answer = gets.chomp.capitalize
      question_list[question] = answer
      write_questions
    end
  end

  def answer_questions
    clear_screen
    puts "Welcome #{self.p2}. Let's try to answer some of #{self.p1}'s questions."
    question_array.each do |question|
      puts question
      answer = gets.chomp.capitalize
      if answer == question_list[question.to_s]
        self.score += 1
        if question != question_array.last
          puts "Good job. Your score is #{self.score}."
        end
      else
        if question != question_array.last
          puts "Sorry, that's incorrect. The correct answer is #{question_list[question.to_s]}. Your current score is #{self.score}."
        end
      end
    end
    puts "Your final score is #{self.score}"
    play_again
  end

end

g = Game.new
