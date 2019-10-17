require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/board'
require_relative 'lib/box'
require_relative 'lib/player'
require_relative 'lib/game'

puts "-"*150
puts"  
                                                    ╔╗╔╗╔╦═══╦╗──╔═══╦═══╦═╗╔═╦═══╗
                                                    ║║║║║║╔══╣║──║╔═╗║╔═╗║║╚╝║║╔══╝
                                                    ║║║║║║╚══╣║──║║─╚╣║─║║╔╗╔╗║╚══╗
                                                    ║╚╝╚╝║╔══╣║─╔╣║─╔╣║─║║║║║║║╔══╝
                                                    ╚╗╔╗╔╣╚══╣╚═╝║╚═╝║╚═╝║║║║║║╚══╗
                                                    ─╚╝╚╝╚═══╩═══╩═══╩═══╩╝╚╝╚╩═══╝
                                                            ─╔╗─────╔╗╔╗
                                                            ╔╝╚╗───╔╝╚╣║
                                                            ╚╗╔╬══╗╚╗╔╣╚═╦══╗
                                                            ─║║║╔╗║─║║║╔╗║║═╣
                                                            ─║╚╣╚╝║─║╚╣║║║║═╣
                                                            ─╚═╩══╝─╚═╩╝╚╩══╝
                                            ╔═╗╔═╦═══╦═══╦══╗╔═══╦═══╦╗╔═╦═══╦════╦╗─╔╦═══╦═╗─╔╗
                                            ║║╚╝║║╔═╗║╔═╗║╔╗║║╔═╗║╔═╗║║║╔╣╔═╗║╔╗╔╗║║─║║╔═╗║║╚╗║║
                                            ║╔╗╔╗║║─║║╚═╝║╚╝╚╣║─║║║─╚╣╚╝╝║║─║╠╝║║╚╣╚═╝║║─║║╔╗╚╝║
                                            ║║║║║║║─║║╔╗╔╣╔═╗║╚═╝║║─╔╣╔╗║║║─║║─║║─║╔═╗║║─║║║╚╗║║
                                            ║║║║║║╚═╝║║║╚╣╚═╝║╔═╗║╚═╝║║║╚╣╚═╝║─║║─║║─║║╚═╝║║─║║║
                                            ╚╝╚╝╚╩═══╩╝╚═╩═══╩╝─╚╩═══╩╝╚═╩═══╝─╚╝─╚╝─╚╩═══╩╝─╚═╝"


puts "-"*150
puts ''

    # Fonction rejoue NON-STOP
play_again = true 
while play_again do

    # Crée un Game
    game = Game.new

    # Boucle qui simule les tours jusqu'aux résultats WIN or DRAW

    while game.has_winner == false && game.board.available_boxes_names.size != 0

        [game.player1,game.player2].each do |player|
            if game.has_winner == false && game.board.available_boxes_names.size != 0
                box_name = player.box_choice(game.board.available_boxes_names)
                box = game.board.content_array.find {|box| box.name == box_name}
                box.content = player.symbol
                game.board.available_boxes_names.delete(box_name)
                puts "available boxes : #{game.board.available_boxes_names}"
                game.board.display
                game.update_winner
            end           
        end
    end  

    if game.has_winner == false && game.board.available_boxes_names.size == 0


puts "-"*150
puts "                                                            DRAW GAME 
                                                              You are BOTH 
                                                    
                                                    ▒█░░░ ▒█▀▀▀█ ▒█▀▀▀█ ▒█▀▀▀ ▒█▀▀█ ▒█▀▀▀█ 
                                                    ▒█░░░ ▒█░░▒█ ░▀▀▀▄▄ ▒█▀▀▀ ▒█▄▄▀ ░▀▀▀▄▄ 
                                                    ▒█▄▄█ ▒█▄▄▄█ ▒█▄▄▄█ ▒█▄▄▄ ▒█░▒█ ▒█▄▄▄█ "

puts ""
puts ""

    end
end 






    

    