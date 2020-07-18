class TicTacToe
  def initialize
    @@play_number = 0
    @@square_1 = "S1"
    @@square_2 = "S2"
    @@square_3 = "S3"
    @@square_4 = "S4"
    @@square_5 = "S5"
    @@square_6 = "S6"
    @@square_7 = "S7"
    @@square_8 = "S8"
    @@square_9 = "S9"

    puts "Welcome to the game"
    
    display_board
  end

  def play_game
    while @@play_number < 9
      play_round

      if @@play_number == 9
        puts "Game Over. No one wins"
        exit
      end
    end
  end

  private
  def play_round
    # Player 1
    if @@play_number % 2 == 0
      valid = false
      if !valid
        while !valid 
          puts "Player 1, select a position:"
          player1_input = gets
          valid = validate_and_record_input(player1_input,"X")
        end
      end
    # Player 2  
    else
      valid = false
      if !valid
        while !valid 
          puts "Player 2, select a position:"
          player2_input = gets
          valid = validate_and_record_input(player2_input,"O")
        end
      end
    end

    result = check_for_winner

    display_board
    @@play_number += 1
    if result == "No winner"
    elsif result == "X"
      puts "Player 1 wins!"
      exit
    elsif result == "O"
      puts "Player 2 wins!"
      exit
    else 
      puts "ERROR"
      exit
    end
  end

  def display_board
    puts "#{@@square_1} | #{@@square_2} | #{@@square_3}"
    puts "------------"
    puts "#{@@square_4} | #{@@square_5} | #{@@square_6}"
    puts "------------"
    puts "#{@@square_7} | #{@@square_8} | #{@@square_9}"
  end

  def validate_and_record_input(player_input,player_id)
    case player_input
    when "S1\n"
      if @@square_1 == "S1"
        @@square_1 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S2\n"
      if @@square_2 == "S2"
        @@square_2 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end    
    when "S3\n"
      if @@square_3 == "S3"
        @@square_3 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S4\n"
      if @@square_4 == "S4"
        @@square_4 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S5\n"
      if @@square_5 == "S5"
        @@square_5 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S6\n"
      if @@square_6 == "S6"
        @@square_6 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S7\n"
      if @@square_7 == "S7"
        @@square_7 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S8\n"
      if @@square_8 == "S8"
        @@square_8 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    when "S9\n"
      if @@square_9 == "S9"
        @@square_9 = player_id
        return true
      else
        puts "Spot taken already. Try again:"
        return false
      end
    else
      puts "Invalid input. Try again:"
      return false
    end
  end

  def check_for_winner
    diagonal1 = @@square_1 == @@square_5 && @@square_5 == @@square_9
    diagonal2 = @@square_3 == @@square_5 && @@square_5 == @@square_7
    column1 = @@square_1 == @@square_4 && @@square_4 == @@square_7
    column2 = @@square_2 == @@square_5 && @@square_5 == @@square_8
    column3 = @@square_3 == @@square_6 && @@square_6 == @@square_9
    row1 = @@square_1 == @@square_2 && @@square_2 == @@square_3
    row2 = @@square_4 == @@square_5 && @@square_5 == @@square_6
    row3 = @@square_7 == @@square_8 && @@square_8 == @@square_9

    case
    when diagonal1
      return @@square_1
    when diagonal2
      return @@square_3
    when column1
      return @@square_1
    when column2
      return @@square_2
    when column3
      return @@square_3
    when row1
      return @@square_1
    when row2
      return @@square_4
    when row3
      return @@square_7
    else
      return "No winner"
    end
  end

end


game = TicTacToe.new
game.play_game