require_relative 'IO_helper'
require_relative 'table'
require_relative 'robot'

class Controller

	attr_accessor :is_placed, :instructions, :table, :robot
	
	public
	def initialize		
		@is_placed = false
		@table = Table.new(5,5)
		@robot = Robot.new		
	end
	
	def is_placed=(is_placed)
		@is_placed = is_placed
	end
	
	def table
		@table
	end
	
	def robot
		@robot
	end
	
	def read_file(file_name)
		begin
			@instructions = IOHelper.read_file(file_name)
		rescue Exception => e
			raise Exception
		end
			
	end
	
	def start
		
		return 'No instructions found.' if @instructions == nil
		
		@instructions.each do |instruction|	  
		  
		  if instruction.include? "PLACE"
			temp = (instruction.gsub! 'PLACE ', '').strip.split(',')
			if temp.size != 3
				puts "Invalid arguments for PLACE command : #{instruction}, Ignored"			
				next
			else
				next unless @table.validate?(temp[0].dup.to_i, temp[1].dup.to_i)
				@is_placed = true
				@robot.place(temp[2])
				@table.place(temp[0].dup.to_i, temp[1].dup.to_i)
				next
			end			
		  end
		  
		  if (instruction.include? "PLACE") && (@is_placed == false)
			puts "Ignoring command, #{instruction.strip}: first PLACE command not found yet."
			next
		  end
		  
		  next unless @is_placed
		  
		  process_instruction(instruction)
		  
		end
		
		puts "The file contains invalid instructions" unless @is_placed
		true
		
	end
	
	def process_instruction(instruction)
		return "Robot is not placed yet." unless @is_placed
		
		case instruction.strip
			when "MOVE"
				self.move
			when "LEFT", "RIGHT"
				robot.change_direction(instruction.strip)
			when "REPORT"
				self.report
			else
				puts "Invalid instruction ignored #{instruction.strip}"
		end
	end
	
	def move
	
		return "Robot is not placed yet." unless @is_placed
		
		case @robot.direction
			when "WEST"
				@table.place( @table.x - 1, table.y) if @table.validate?( @table.x - 1, table.y)
			when "EAST"
				@table.place( @table.x + 1, table.y) if @table.validate?( @table.x + 1, table.y)
			when "NORTH"
				@table.place( @table.x, table.y+1) if @table.validate?( @table.x, table.y+1)
			when "SOUTH"
				@table.place( @table.x, table.y-1) if @table.validate?( @table.x, table.y-1)
			else
				puts "Invalid direction Ignored"
		end
		
	end	
	
	def report
		puts "#{@table.x}, #{@table.y}, #{@robot.direction}"
	end

end