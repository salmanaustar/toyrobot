class IOHelper

	private
    attr_accessor :file_name
	
	public 
	def self.read_file(file_name)
		@file_name = file_name
		instructions = nil
		file = nil
		
		begin
			
			file = File.open(File.expand_path(file_name, __FILE__), 'r') do |f1| 
				instructions = Array.new
				while line = f1.gets 
					instructions.push line
				end
			end
			
		
		rescue Exception => e
			instructions = nil
			raise Exception.new("Invalid filename/path")		
		ensure
			file.close unless file.nil?
		end  
		
		return instructions
	end
   
end
