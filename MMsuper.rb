def play_super(secret)
  puts "I have generated a sequence with six elements made up of:(r)ed,(g)reen,(b)lue,(p)ink,(a)qua,and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chars.to_a
  user_guess.each do |letter|
    if (letter=="C" or letter=="c")
      puts secret.join(",")
      play_super secret
    elsif (letter=="q" or letter=="Q")
      puts "That's too bad, goodbye"
      return
    else
     matches = Array.new
     misses = Array.new
     secret.each_with_index do |letter, index|
		     if(letter == user_guess[index])
		        matches.push(index)
         else
            misses.push(index)
          end
      end
    end
    if (misses.length==0)
      puts "Congratulations! You guessed the sequence #{secret}.Do you want to play again?Y/N"
      user_choice=gets.chomp.upcase
      if user_choice=="Y"
        play_super get_secret "super"
      else
        puts "That's too bad,goodbye"
      end.play_super
    elsif (misses.length != 0)
      puts "You have #{matches.length} in the right place"
      puts "You have #{misses.length} in the wrong place"
      puts "I am going to start again, please stand by....."
      play_super secret
    else
      puts "test"
    end
  end
end