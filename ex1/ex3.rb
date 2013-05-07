
class Game

  attr_accessor :p1, :p2

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @question_array = []
    @p1_answers = []
    @p2_answers = []
    @played = false
    play
  end

  def make_a_choice(repeat_text, choice, yes, no)
    if choice =~ /^y/ || choice =~ /^Y/
      yes.call
    elsif choice =~ /^n/ || choice =~ /^N/
      no.call
    else
      puts repeat_text
      choice = gets.chomp
      make_a_choice(repeat_text, choice, yes, no)
    end
  end

  def play
    if !@played
      welcome()
    else
      play_again()
    end
  end

  def welcome
    welcome_text = "Welcome to the Newly Pair Game, #{ p1 } and #{ p2 }. Would you like to read the instructions?"
    puts welcome_text
    instructions = gets.chomp
    make_a_choice(welcome_text, instructions, read_instructions, start_game)
  end

  read_instructions = Proc.new do
    instruction_text = "The Newly Pair Game is for two players. The first player secretly chooses as many personal questions as they\'d like their partner to answer. The second player then attempts to answer each question correctly. Is Player One prepared to begin?"
    puts instruction_text
    p1_begin = gets.chomp
    make_a_choice(instruction_text, p1_begin, start_game, be_nice(read_instructions))
  end

  be_nice = Proc.new do |then_do|
    puts 'Take your time.'
    then_do
  end

  start_game = Proc.new do
    while true
      if @question_array.length == 0
        puts 'What would you like to ask Player 2?'
      else
        question_feedback = ['What a great Q!', 'Sassy Q!', 'Now that\'s a Q you don\'t see every day!', 'Incredible Q!', 'Dyno-mite Q!', 'You\'ve done this before, haven\'t you?']
        random_feedback = rand(question_feedback.length)
        puts "#{ question_feedback[random_feedback] } What else would you like to ask Player 2? If you\'re done writing questions, just press enter."
      end

      question = gets.chomp

      if question.length == 0 && @question_array.length != 0
        puts "Congrats, player 1. You\'re all done. Press enter to continue to Player 2\'s turn."
        continue = gets.chomp
        if continue
          start_player_2
        end
      elsif question.length == 0 && question_array.length == 0
        puts 'You must enter at least one question'
        start_game
      else
        @question_array.push(question)
      end
    end
  end

end
