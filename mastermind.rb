class Mastermind_2
  def initialize
    @@game_type = -999
		@@round_number = 0
		@@code = Array[0,0,0,0]
	  @@feedback = Array["-","-","-","-"]
    @@guess = Array["-","-","-","-"]
    @@a = Array[-999,-999,-999,-999,-999,-999]
    @@b = Array[-999,-999,-999,-999,-999,-999]
    @@c = Array[-999,-999,-999,-999,-999,-999]
    @@d = Array[-999,-999,-999,-999,-999,-999]
    @@e = Array[-999,-999,-999,-999,-999,-999]

    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Welcome to Mastermind."
    puts "Enter 1' to be code breaker or 0 to be mastermind:"
	end

  def set_game_type
    @@game_type = gets
    if @@game_type[0] == "0"
      puts ""
      puts "---------------------------------------------------------------------------------"
      puts "Welcome, Mastermind"
      puts "Your mission is to set the 4-color code for the computer to try to crack."
      puts "Possible colors are R, O, Y, G, B, P."
      puts "Colors may be used more than once in a code."
      puts "Input a string of 4 colors to set the code."
      puts "The computer will then get 12 guesses to hack the code. Good luck..."
      puts "---------------------------------------------------------------------------------"
      puts ""
      play_game_type_0
    elsif @@game_type[0] == "1"
      puts ""
      puts "---------------------------------------------------------------------------------"
      puts "Welcome to Mastermind, Codebreaker"
      puts "Your mission is to guess the 4-color code."
      puts "Possible colors are R, O, Y, G, B, P."
      puts "Colors may be used more than once in a code."
      puts "Input a string of 4 colors to guess the code."
      puts ""
      puts "Feedback on accuracy of code is as follows:"
      puts "A 'o' means that the color and location are correct"
      puts "A 'x' means that the color is correct but it is in the wrong location in the code"
      puts "A '-' means the color is not in the code."
      puts ""
      puts "You get 12 guesses to hack the code. Good luck..."
      puts "---------------------------------------------------------------------------------"
      puts ""
      play_game_type_1
    else
      puts "Invalid game type. Restart to try again."
      exit
    end
  end

	def play_game_type_0
			while @@round_number < 12
					if @@round_number == 0
						set_code_type_0
          end
          
          play_round_type_0
          
          if @@feedback[0] == "o" && @@feedback[1] == "o" && @@feedback[2] == "o" && @@feedback[3] == "o"
            puts "---------------------------"
            puts "Code cracked! Computer wins!"
            puts "---------------------------"
						exit
          end
          
          if @@round_number == 12
            puts "---------------------------"
            puts "Game Over. Mastermind wins."
            puts "Code was: "
            print @@code
            puts
            puts "---------------------------"
						exit
					end
			end
  end #play_game_type_0
  
  def play_game_type_1
    while @@round_number < 12
        if @@round_number == 0
          set_code_type_1
        end
        play_round_type_1
        
        if @@feedback[0] == "o" && @@feedback[1] == "o" && @@feedback[2] == "o" && @@feedback[3] == "o"
          puts "---------------------------"
          puts "You win!"
          puts "Code was: "
          print @@code
          puts
          puts "---------------------------"
          exit
        end
        
        if @@round_number == 12
          puts "---------------------------"
          puts "Game Over. Mastermind wins."
          puts "Code was: "
          print @@code
          puts
          puts "---------------------------"
          exit
        end
    end
  end #play_game_type_1

	private
  def set_code_type_0
    valid = false
    if !valid
      while !valid
        puts "Enter your code:"
        @@code = gets
        valid = validate_input(@@code)
        @@code = @@code.upcase
      end
    end
	end #set_code_type_0

  def play_round_type_0
    @@round_number+=1
    puts "Attempt " + @@round_number.to_s
    
    if @@round_number == 1
      @@guess[0] = ["R","O","Y","G","B","P"].sample
      @@guess[1] = ["R","O","Y","G","B","P"].sample
      @@guess[2] = ["R","O","Y","G","B","P"].sample
      @@guess[3] = ["R","O","Y","G","B","P"].sample

    else
      @@guess[0] = compute_guess(@@a,@@previous_guess,0)
      @@guess[1] = compute_guess(@@b,@@previous_guess,1)
      @@guess[2] = compute_guess(@@c,@@previous_guess,2)
      @@guess[3] = compute_guess(@@d,@@previous_guess,3)
    end
    print @@guess
    puts ""
    @@previous_guess = @@guess
    
    give_feedback(@@guess,@@code)
    
    @@red = 0
    @@orange = 0
    @@yellow = 0
    @@green = 0
    @@blue = 0
    @@purple = 0

    @@a = record_feedback(@@feedback,@@previous_guess,@@a,0)
    @@b = record_feedback(@@feedback,@@previous_guess,@@b,1)
    @@c = record_feedback(@@feedback,@@previous_guess,@@c,2)
    @@d = record_feedback(@@feedback,@@previous_guess,@@d,3)

  end #play_round_type_0
  
  def set_code_type_1
    @@code[0] = ["R","O","Y","G","B","P"].sample
    @@code[1] = ["R","O","Y","G","B","P"].sample
    @@code[2] = ["R","O","Y","G","B","P"].sample
    @@code[3] = ["R","O","Y","G","B","P"].sample   
  end #set_code_type_1
  
  def play_round_type_1
    @@round_number+=1
    puts "Attempt " + @@round_number.to_s
    valid = false
    if !valid
      while !valid
        puts "Enter your guess:"
        @@guess = gets
        valid = validate_input(@@guess)
      end
    end

    give_feedback(@@guess,@@code)
  end #play_round_type_1
  

  def validate_input(input)
    input = input.upcase
    if input.length != 5
      puts "Invalid input. Code must be four letters long. Try again:"
      return false
    end
  
    if ["R","G","O","Y","B","P"].include?(input[0]) && ["R","G","O","Y","B","P"].include?(input[1]) && ["R","G","O","Y","B","P"].include?(input[2]) && ["R","G","O","Y","B","P"].include?(input[3])
      return true
    else
      puts "Invalid input. Accepted characters are R, G, O, Y, B, P. Try again:"
      return false
    end
  end #validate

  def give_feedback(guess,code)
    @@feedback = ["-","-","-","-"]
    if @@game_type[0] == "1"
      guess = guess.upcase
    end
    red_count = code.count("R")
    orange_count = code.count("O")
    yellow_count = code.count("Y")
    green_count = code.count("G")
    blue_count = code.count("B")
    purple_count = code.count("P")
    
    temp_0 = guess[0]
    temp_1 = guess[1]
    temp_2 = guess[2]
    temp_3 = guess[3]

    # check for correct answers
    #position 1
    if guess[0] == code[0]
      @@feedback[0] = "o"
      if guess[0] == "R"
        red_count -= 1
      elsif guess[0] == "O"
        orange_count -= 1
      elsif guess[0] == "Y"
        yellow_count -= 1
      elsif guess[0] == "B"
        blue_count -= 1
      elsif guess[0] == "P"
        purple_count -=1
      end
      guess[0] = "-"
    end
    #position 2
    if guess[1] == code[1]
      @@feedback[1] = "o"
      if guess[1] == "R"
        red_count -= 1
      elsif guess[1] == "O"
        orange_count -= 1
      elsif guess[1] == "Y"
        yellow_count -= 1
      elsif guess[1] == "B"
        blue_count -= 1
      elsif guess[1] == "P"
        purple_count -=1
      end
      guess[1] = "-"
    end
    #position 3
    if guess[2] == code[2]
      @@feedback[2] = "o"
      if guess[2] == "R"
        red_count -= 1
      elsif guess[2] == "O"
        orange_count -= 1
      elsif guess[2] == "Y"
        yellow_count -= 1
      elsif guess[2] == "B"
        blue_count -= 1
      elsif guess[2] == "P"
        purple_count -=1
      end
      guess[2] = "-"
    end
    #position 4
    if guess[3] == code[3]
      @@feedback[3] = "o"
      if guess[0] == "R"
        red_count -= 1
      elsif guess[3] == "O"
        orange_count -= 1
      elsif guess[3] == "Y"
        yellow_count -= 1
      elsif guess[3] == "B"
        blue_count -= 1
      elsif guess[3] == "P"
        purple_count -=1
      end
      guess[3] = "-"
    end

    # give feedback on correct colors
    case 
    when (guess[0] == "R") && (red_count >= 1)
      @@feedback[0] = "x"
      red_count -= 1
    when (guess[0] == "O") && (orange_count >= 1)
      @@feedback[0] = "x"
      orange_count -= 1
    when (guess[0] == "Y") && (yellow_count >= 1)
      @@feedback[0] = "x"
      yellow_count -= 1
    when (guess[0] == "G") && (green_count >= 1)
      @@feedback[0] = "x"
      green_count -= 1
    when (guess[0] == "B") && (blue_count >= 1)
      @@feedback[0] = "x"
      blue_count -= 1
    when (guess[0] == "P") && (purple_count >= 1)
      @@feedback[0] = "x"
      purple_count -= 1
    end

    case
    when (guess[1] == "R") && (red_count >= 1)
      @@feedback[1] = "x"
      red_count -= 1
    when (guess[1] == "O") && (orange_count >= 1)
      @@feedback[1] = "x"
      orange_count -= 1
    when (guess[1] == "Y") && (yellow_count >= 1)
      @@feedback[1] = "x"
      yellow_count -= 1
    when (guess[1] == "G") && (green_count >= 1)
      @@feedback[1] = "x"
      green_count -= 1
    when (guess[1] == "B") && (blue_count >= 1)
      @@feedback[1] = "x"
      blue_count -= 1
    when (guess[1] == "P") && (purple_count >= 1)
      @@feedback[1] = "x"
      purple_count -= 1
    end
    
    case
    when (guess[2] == "R") && (red_count >= 1)
      @@feedback[2] = "x"
      red_count -= 1
    when (guess[2] == "O") && (orange_count >= 1)
      @@feedback[2] = "x"
      orange_count -= 1
    when (guess[2] == "Y") && (yellow_count >= 1)
      @@feedback[2] = "x"
      yellow_count -= 1
    when (guess[2] == "G") && (green_count >= 1)
      @@feedback[2] = "x"
      green_count -= 1
    when (guess[2] == "B") && (blue_count >= 1)
      @@feedback[2] = "x"
      blue_count -= 1
    when (guess[2] == "P") && (purple_count >= 1)
      @@feedback[2] = "x"
      purple_count -= 1
    end

    case
    when (guess[3] == "R") && (red_count >= 1)
      @@feedback[3] = "x"
      red_count -= 1
    when (guess[3] == "O") && (orange_count >= 1)
      @@feedback[3] = "x"
      orange_count -= 1
    when (guess[3] == "Y") && (yellow_count >= 1)
      @@feedback[3] = "x"
      yellow_count -= 1
    when (guess[3] == "G") && (green_count >= 1)
      @@feedback[3] = "x"
      green_count -= 1
    when (guess[3] == "B") && (blue_count >= 1)
      @@feedback[3] = "x"
      blue_count -= 1
    when (guess[3] == "P") && (purple_count >= 1)
      @@feedback[3] = "x"
      purple_count -= 1
    end

    guess[0] = temp_0
    guess[1] = temp_1
    guess[2] = temp_2
    guess[3] = temp_3
    print @@feedback
    puts
  end #give_feedback

# game_type_0 functions
  def record_feedback(feedback,guess,array,index)
    if feedback[index] == "o"
      case
      when guess[index] == "R"
        array = [1,0,0,0,0,0]
      when guess[index] == "O"
        array = [0,1,0,0,0,0]
      when guess[index] == "Y"
        array = [0,0,1,0,0,0]
      when guess[index] == "G"
        array = [0,0,0,1,0,0]
      when guess[index] == "B"
        array = [0,0,0,0,1,0]
      when guess[index] == "P"
        array = [0,0,0,0,0,1]
      end

    elsif feedback[index] == "-"
      case guess[index]
      when "R"
        array[0] = 0
      when "O"
        array[1] = 0
      when "Y"
        array[2] = 0
      when "G"
        array[3] = 0
      when "B"
        array[4] = 0
      when "P"
        array[5] = 0
      end
    else
      case guess[index]
      when "R"
        array[0] = 0
        @@red += 1
      when "O"
        array[1] = 0
        @@orange += 1
      when "Y"
        array[2] = 0
        @@yellow += 1
      when "G"
        array[3] = 0
        @@green += 1
      when "B"
        array[4] = 0
        @@blue += 1
      when "P"
        array[5] = 0
        @@purple += 1
      end
    end
    return array
  end #record_feedback

  def compute_guess(array,previous_guess,index)
    new_guess = "-"
    if array.include?(1)
      new_guess = previous_guess[index]
    else
      if @@red >=1 and array[0] == -999
        new_guess = "R"
        @@red -= 1
      elsif @@orange >= 1 and array[1] == -999
        new_guess = "O"
        @@orange -= 1
      elsif @@yellow >= 1 and array[2] == -999
        new_guess = "Y"
        @@yellow -= 1
      elsif @@green >= 1 and array[3] == -999
        new_guess = "G"
        @@green -= 1
      elsif @@blue >= 1 and array[4] == -999
        new_guess = "B"
        @@blue -= 1
      elsif @@purple >= 1 and array[5] == -999
        new_guess = "P"
        @@purple -= 1
      else
        new_guess = ["R","O","Y","G","B","P"].sample
      end
    end
    return new_guess
  end #compute_guess
end #Mastermind


# Play game
game = Mastermind_2.new
game.set_game_type