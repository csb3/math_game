class Game
  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end

  def ask_question(player)
    @question = Question.new
    puts "#{player.name}: What is #{@question.number1} #{@question.operator} #{@question.number2}?\n"
    player_answer = gets.chomp.to_i
    if player_answer != @question.correct_answer
      player.lives -= 1
      puts "#{player.name}: Incorrect!"
    else
      puts "#{player.name}: Correct!"
    end
  end

  def print_scores
    puts "P1: #{@player1.lives} VS. P2: #{@player2.lives}"
  end

  def check_scores
    if @player1.lives == 0 || @player2.lives == 0
      @player1.lives != 0 ? winner = @player1: winner = @player2
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      puts '-----Game over!------'
    else
      p '-------NEW TURN--------'
    end
  end

  def play_turn(player)
    ask_question(player)
    print_scores
    check_scores
  end

  def start
    @current_player = @player1
    while @player1.lives > 0 && @player2.lives > 0
      play_turn(@current_player)
      @current_player.name == @player1.name ? @current_player = @player2 : @current_player = @player1
    end
  end
end
