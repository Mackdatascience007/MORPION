
class Game
    attr_accessor :board, :player1, :player2, :has_winner, :winner

    def initialize  
        # Crée un joueur, lui demande son prénom et son symbole
        @player1 = Player.new
        puts @player1.symbol_choice
        
        # Crée le deuxième joueur et lui attribue l'autre symbole
        available_symbols = ["O","X"]
        available_symbols.delete(@player1.symbol)
        @player2 = Player.new
        @player2.symbol = available_symbols[0]
        puts "#{@player2.name} you will play with the #{@player2.symbol} symbol"

        # Affiche la grille initiale
        @board = Board.new
        @board.display
        @has_winner = false
    end

        # Méthode qui scanne les array avec historique des cases cochées par les joueurs et regarde si ils contiennent les combinaisons gagnantes
    def winner?(player)
        winning_combinations = [
            ["A1","B1","C1"],
            ["A2","B2","C2"],
            ["A3","B3","C3"],
            ["A1","A2","A3"],
            ["B1","B2","B3"],
            ["C1","C2","C3"],
            ["A1","B2","C3"],
            ["A3","B2","C1"]
        ]
        result = false
        winning_combinations.each do |combi|
            result = combi.all? { |e| player.hit_box_array.include?(e) }
            break if result
        end 
        return result
    end 

    def update_winner
        @has_winner = winner?(player1) || winner?(player2)
        if has_winner
            if winner?(player1)
                @winner = player1
                puts "Congrats #{player1.name} YOU ARE THE WINNER ! "
                
            else 
                @winner = player2
                puts "Congrats #{player2.name} YOU ARE THE WINNER ! "
                
            end 
        end 
    end 
end