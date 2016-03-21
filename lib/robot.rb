class Robot

	private
	attr_accessor :direction
	
	
	public	
	def place(direction)
		@direction = direction.strip.upcase if validate_direction?(direction)
	end
	
	def direction
		@direction
	end
	
	def change_direction(rotation)
		return unless validate_rotation?(rotation)
		case rotation.upcase
			when "LEFT"
				if @direction == "WEST"
					@direction = "SOUTH"
				elsif @direction == "SOUTH"
					@direction = "EAST"
				elsif @direction == "EAST"
					@direction = "NORTH"
				elsif @direction == "NORTH"
					@direction = "WEST"
				end
			when "RIGHT"
				if @direction == "WEST"
					@direction = "NORTH"
				elsif @direction == "NORTH"
					@direction = "EAST"
				elsif @direction == "EAST"
					@direction = "SOUTH"
				elsif @direction == "SOUTH"
					@direction = "WEST"
				end
		end 
		
		return @direction
	end
	
	private
	def validate_direction?(direction)
		return true if(['NORTH', 'SOUTH', 'EAST' , 'WEST'].include?(direction.upcase))
	end
	
	def validate_rotation?(rotation)
		return true if(['LEFT', 'RIGHT'].include?(rotation.upcase))
	end
	
	
	
end