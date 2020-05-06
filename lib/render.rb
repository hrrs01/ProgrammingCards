require 'ruby2d'

module Render
	include Ruby2D
	
	CARDS = { 
		empty: {
			color:'blue',
			height: 100,
			width: 75
		},
		spell: {
			color: "green",
		height: 100,
		width: 75,
		
		},
		monster: {
			color: "orange",
			height: 100,
			width: 75
		},
		grave: {
			color: "yellow",
			height: 100,
			width: 75
		},
		deck: {
			color: "red",
			height: 100,
			width: 75
		
		},
	}
	
	def self.display windowName, board
		@x = 900
		@y = 600
		@window = Ruby2D::Window.new({ title: windowName, width: @x, height: @y })
		
		createBoard board
		
		@window.show
		
	end
	
	def hand= hand
		@hand = hand
	
	end
	
	def slots= slots
		@slots = slots
	
	end
	
	def self.createBoard board
		background = Ruby2D::Rectangle.new({
			color: 'blue',
			width: @x,
			height: @y
		})
		
		paddingx = 50
		paddingy = 50
		
		@board = Ruby2D::Rectangle.new({
			color: 'gray',
			width: @x-(2*paddingx),
			height: @y-(2*paddingy),
			x: paddingx,
			y: paddingy
		})
		
		@slots = []
		@hand = []
		# Create empty field
		5.times do |x|
			temp = Ruby2D::Rectangle.new(CARDS[:empty])
			temp.x = (@x/2-250) + (x%5 * 100)
			temp.y = (@y/2) - 50
			@slots << temp
		
		end
		
		# Create empty hand 
		5.times do |x|
			temp = Ruby2D::Rectangle.new(CARDS[:empty])
			temp.x = (@x/2-225) + (x%5 * 85)
			temp.y = @y - 175
			@hand << temp
		
		end
		
		# Create deck
		@deck = [Ruby2D::Rectangle.new(CARDS[:deck])]
		@deck[0].x = (@x/2-375)
		@deck[0].y = @y - 175
		
		# Create grave
		@grave = [Ruby2D::Rectangle.new(CARDS[:grave])]
		@grave[0].x = (@x/2-375)
		@grave[0].y = @y/2 - 50
		
	end


end