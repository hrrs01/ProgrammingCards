class Board
	
	
	
	def initialize name, file, cardpath
		@commands = {
			"play" => Proc.new{|args|
				#p args
				type, pos = read_pos(args[0])
				if type==:hand
					@slots[0] = @hand[pos]
				end
			}
		}
		@name = name
		@file = file
		@cardpath = cardpath
		@turn_counter = 0
		@hand = []
		@slots = Array.new(5)
		@grave = []
		temp_data = File.read @file
		temp_data = temp_data.split ?:
		temp_deck = temp_data[0].split(?\;).map{|x|x.gsub(?\n, "")}
		@deck = []
		load_deck temp_deck
		@actions = temp_data[1].split ?\;
		@actions=@actions.map{|x|x.gsub("\n", "").split(?\s)}
		
		begin_game
	end
		
	def begin_game	
		@turn_counter = 0
		start_action_loop
	end
	
	def start_action_loop
		while new_turn
			@actions.each{|x|
				do_action x
			}
		end
	end
	
	def do_action command
		cmd, *args = command
		(@commands[cmd]).call(args)
	end
	
	def new_turn
		yes = @deck.size>0
		@turn_counter += 1
		@hand << @deck.pop if @deck.size > 0
		return yes
	end
	
	def board
		[@hand, @slots, @grave, @deck]
	end
	
	def load_deck temp_deck
		temp_deck.each{|x|
			load_card(x)
		}
	end

	
	def load_card cardname
		require(@cardpath+"/"+cardname)
		@deck << load(board)
	end
	
	def read_pos x
		pos, i = x.split(?.)
		return [pos=="hand" ? (:hand) : (:slot), i.to_i]
	end


	


end