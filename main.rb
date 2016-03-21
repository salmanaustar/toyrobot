require "./lib/controller"

abort("Invalid Argument(s), Please provide the filename as Arguments\nexample: ruby main.rb test.txt") if ARGV.size <= 0

controller = Controller.new
begin
	controller.read_file(ARGV[0])
rescue Exception => e
	puts "Error reading file. Please verify your filename/path and try again."
	exit!
end

controller.start