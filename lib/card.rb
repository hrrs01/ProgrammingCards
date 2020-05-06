class Card
	
					# Function  Value      event function?
	CardTypes = {spell: 0, monster: 1, trap: 2}
	
	def initialize name,board,type
		@name=name
		@type=type
		@board=board

	end

end