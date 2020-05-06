require "../lib/card.rb"
class Spell < Card
	def initialize name, board, &block
		super(name, board, CardTypes[:monster])
		
	end
	def cast
		block.call @board
	end
end