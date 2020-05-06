require "../lib/card.rb"
class Monster < Card
	def initalize name, board, value=nil
		super(name, board, CardTypes[:monster])
		@value = value
	
	end
	
	def value= x
		@value = x
	end
	
	def value
		@value
	end

end