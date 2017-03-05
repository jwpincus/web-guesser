require "sinatra"
require 'sinatra/reloader'
require 'pry-state'
secret_number = rand(1..100)
def check_guess(guess, number)
  if guess != (nil || "")
    if guess.to_i > number && ((guess.to_i - number).abs < 6)
      "Too high"
    elsif guess.to_i < number && ((guess.to_i - number).abs < 6)
      "Too low"
    elsif guess.to_i < number
      "Way Too Low"
    elsif guess.to_i > number
      "Way Too High"
    elsif guess.to_i == number
      "Nailed it!"
    end
  else 
    "Make a Guess"
  end
  
end
get "/" do 
  response = check_guess(@params['guess'], secret_number)
  correct_answer = "The Number is actually #{secret_number}" if (response == "Nailed it!")
  erb :index, :locals => {:number => correct_answer, :response => response}

end
