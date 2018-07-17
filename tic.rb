#---------------------------------BoardCase-------------------------------------
#-------------------------------------------------------------------------------

class BoardCase
  #définit les valeurs (X, O, ' ') dans les cases
  attr_accessor :valeur
  
  #initialise chaque case avec un espace
  def initialize
    @valeur = ' '
  end
  
  #affiche la valeur en string
  def to_s
    return @valeur
  end
  
  def valid?(number)
    #vérifie si le chiffre entré est valide
    if !(0..8).include?(number)
      return false
    end
    #vérifie que la case n'est pas déjà prise
    if @valeur != ' '
      return false
    end
    return true
  end
end
#-----------------------------------Board---------------------------------------
#-------------------------------------------------------------------------------
class Board
  #la classe Board fait le lien entre la classe BoardCase et la classe Game
  attr_accessor :boardcases
  
  #définit un plateau qui contient 9 instances de la classe BoardCase
  def initialize
    @boardcases = []
    9.times do
      @boardcases.push(BoardCase.new)
    end
  end
  
  #converti les cases en string
  def to_s
    return @boardcases.to_s
  end
  
  #définit la case jouée par une valeur (comprise entre 0 et 8)
  def play(player)
      number = 0
    loop do
      puts "It is #{player.name}'s turn to play"
      puts " choose a boardcase"
      number = gets.chomp.to_i - 1
      #la boucle finit quand le chiffre entré n'est pas valide, ou si la case contient déjà une valeur
      break if @boardcases[number].valid?(number)
    end
    puts 'number ' + number.to_s
    @boardcases[number].valeur = player.valeur
  end

#définit le gagnant
def victory
  victory_lines || victory_columns || victory_diagonal
end
  #victory_lines; victory_columns; victory_diagonal verifient les conditions de victoire
def victory_lines
  victory_lines = [[0,1,2],[3,4,5],[6,7,8]]
  victory_lines.each do |line|
    line_str = ''
    line.each { |x| line_str << @boardcases[x].to_s }
    return true if ['XXX', 'OOO'].include? line_str
  end
  false
end

def victory_columns
  victory_columns = [[0,3,6],[1,4,7],[2,5,8]]
  victory_columns.each do |column|
    column_str = ''
    column.each { |x| column_str << @boardcases[x].to_s }
    return true if ['XXX', 'OOO'].include? column_str
  end
  false
end

def victory_diagonal
  victory_diagonal = [[0,4,8],[2,4,6]]
  victory_diagonal.each do |diagonal|
    diagonal_str = ''
    diagonal.each { |x| diagonal_str << @boardcases[x].to_s }
    return true if ['XXX', 'OOO'].include? diagonal_str
  end
  false
end

#affiche le plateau
def print_board
  puts " #{@boardcases[0]} | #{boardcases[1]} | #{boardcases[2]} "
  puts "---|---|---"
  puts " #{boardcases[3]} | #{boardcases[4]} | #{boardcases[5]} "
  puts "---|---|---"
  puts " #{boardcases[6]} | #{boardcases[7]} | #{boardcases[8]} "
end

#vérifie si le plateau a été rempli
def is_full?
  @boardcases.each do |boardcase|
    return false if boardcase.to_s == ' '
  end
  true
  puts" Game over"
end
end
#-------------------------------Player-----------------------------------------
#------------------------------------------------------------------------------
class Player
  #definit les joueurs
  attr_reader :valeur, :name
  
  #definit le nom et le pion attribué a chaque joueur 
  def initialize(valeur)
    puts "Hi, Player, what is your name ?"
    @name = gets.chomp
    @valeur = valeur
  end
end
#--------------------------------Game--------------------------------------------
#--------------------------------------------------------------------------------
class Game
  attr_accessor :player1, :player2, :board
  
  #initialise le plateau ainsi que les joueurs 
  def initialize
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @board = Board.new
  end
  
  def start_game
    player = @player2
    loop do
      @board.print_board
      #tant que la boucle est vraie, elle réalise l'alternance des joueurs
      if player == @player1
        player = @player2
      else
        player = @player1
      end
      @board.play(player)
      #condition d'arret de la boucle
      break if @board.victory || @board.is_full?
    end
    if @board.victory
      puts "#{player.name} is the winner"
      @board.print_board
    else
      puts 'Match is null, no winner'
    end
  end
end

#lance le jeu
game = Game.new.start_game
