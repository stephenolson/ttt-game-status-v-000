# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
  

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [ #nested array of every winning combination
  
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal down
  [6,4,2]  #diagonal up
  
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination| # iterates through each element of the nested array
    win_index_1 = win_combination[0] # returns index 0 of each element
    win_index_2 = win_combination[1] # returns index 1 of each element
    win_index_3 = win_combination[2] # returns index 2 of each element

    position_1 = board[win_index_1] # applies the index to the board, which is a position
    position_2 = board[win_index_2] # applies the index to the board, which is a position
    position_3 = board[win_index_3] # applies the index to the board, which is a position

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" # if index 0,1,2 (position 1,2,3) is all X or all O
      return win_combination
    end
  end
else
  false
end

def full?(board) #
  board.all? do |box| #is the board full?
    box == "X" || box == "O" # determines is board is full of X's or O's
  end  
end

def draw?(board)
    if full?(board) == true && won?(board) == false # if board is full but no winner
      return true # is a draw
    else
      return false # isn't a draw
    end
  end

def over?(board)
  if won?(board) || draw?(board) || full?(board) # if there's winner or the game is a draw or board is full
  return true # game is over
  else
    return false # game isn't over
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]] == "X" # if there's a winner and index 0 of won?(board) is X
    return "X" # X is the winne
  elsif won?(board) && board[won?(board)[0]] == "O" # if there's a winner and index 0 of won?(board) is O
    return "O" #O is the winne
  else
    nil
  end
end