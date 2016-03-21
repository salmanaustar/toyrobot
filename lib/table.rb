class Table
	
	private
	attr_accessor :width, :height, :x, :y
	
	public
	def initialize(width,height)
		@width, @height = width, height
		@x, @y = 0
	end
	
	def place(x,y)
		@x, @y = x,y if validate?(x,y)
	end
	
	def x
		@x
	end
	
	def y
		@y
	end
	
	def validate?(x,y)
		return true if (x>=0 && x<@width && y>=0 && y <@height)
	end

end