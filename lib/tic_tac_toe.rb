require 'pry'
class TicTacToe 
    WIN_COMBINATIONS=[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2],
        [0,4,8]
    ]
    
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input.to_i - 1        
    end

    def move(input , token = "X")
        @board[input] = token
    end

    def position_taken?(index)
      @board[index] == " " ?  false : true 
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)  
    end

    def turn_count
        count = 0
        @board.each {  |x| x == " " ? nil : count += 1 }
        count 
    end

     def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn 
        puts "choose a position btween 1-9 for your move :" 
        user_input = gets.chomp
        input = input_to_index(user_input)
        
        if valid_move?(input)
            token = current_player
            move(input, token)
        else
            turn
        end
        display_board
    end

    def won?
    WIN_COMBINATIONS.any? do |combination|
      if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        return combination
      end
    end
  end

    def full?
        @board.all? { |x| x != " "}
    end

    def draw? 
        full? && !won?         
    end

    def over?
        won? || draw?
    end

    def winner
       won? ? @board[won?[0]] : nil 
    end

    def play 
        turn until over?

        if won? 
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end
