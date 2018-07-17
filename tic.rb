require 'pry'
#---------------------------------BoardCase-------------------------------------
#-------------------------------------------------------------------------------
class BoardCase
  attr_accessor :valeur
  #definit les valeurs (x,O,nil) dans cases
  def initialize
    @valeur = ' '
  end
  #afficher la valeur en string
  def to_s
    return @valeur
  end

  def valid?(number)
    if !(0..8).include?(number)
      return false
    end
    if
    end
  end
end
#-----------------------------------Board---------------------------------------
#------------------------------------------------------------------------------
class Board
  attr_accessor :boardcases
  #faire le lien entre BoardCase et le Game =
  #definit plateau en lien avec les cases
  def initialize
    @boardcases = []
    9.times do
      @boardcases.push(BoardCase.new)
    end
  end
  #afficher les cases en string
  def to_s
    return @boardcases.to_s
  end
  #definir la case jouée par une valeur
  def play(player)
    loop do
    puts "It is #{player.name}'s turn to play"
    puts " choose a boardcase"
    number = gets.chomp.to_i
    break if
  end
    @boardcases[number].valeur = player.valeur
  end

  end
  #defiir le gagnant
  def victory
    victory_lines || victory_columns || victory_diagonal
  end
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

def print_board
  puts " #{@boardcases[0]} | #{boardcases[1]} | #{boardcases[2]} "
  puts "---|---|---"
  puts " #{boardcases[3]} | #{boardcases[4]} | #{boardcases[5]} "
  puts "---|---|---"
  puts " #{boardcases[6]} | #{boardcases[7]} | #{boardcases[8]} "
end

def is_full?
  @boardcases.each do |boardcase|
    return false if boardcase.to_s == ' '
  end
  true
  puts" Game over"
end
end
#-------------------------------Player-----------------------------------------
#-------------------------------------------------------------------------------
class Player
  # definit les players
  attr_reader :valeur, :name
  def initialize(valeur)
    puts "Hi, Player, what is your name ?"
    @name = gets.chomp
    @valeur = valeur
  end
  #nom et perdant/gagnant
end
#nom et perdant/gagnant
#--------------------------------Game---------------------------------------------
#-------------------------------------------------------------------------------
class Game
  attr_accessor :player1, :player2, :board
  def initialize
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @board = Board.new
  end

  def start_game
    player = @player2
    loop do
      @board.print_board
      if player == @player1
        player = @player2
      else
        player = @player1
      end
      @board.play(player)
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

game = Game.new
game.start_game

binding.pry

# une fonction qui qffiche lq boqrd
# une fonction qui verifiey board plein
# victory_lines 3 fonctions
# fonction pour faire jouer un joueur
# fonction qui demande a jouer tant quil faut
#fonction qui verifie que case jouer pas deja jouée
