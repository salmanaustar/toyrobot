require 'spec_helper'

describe 'Controller' do
	
	before :each do
		@controller = Controller.new
	end
	
	describe '#read_file' do		
		
		it 'will call the IOHelper function to get the instructions array' do
			expect(@controller.read_file('./test.txt')).not_to be_nil
		end
		
		it 'will throw exception on providing the wrong filename/path' do
			expect{@controller.read_file('wrongfile.txt')}.to raise_error(Exception)
		end
		
		
	end
	
	describe '#start' do
		it 'will not excecute if instructions are nil' do 
			expect(@controller.start).to eq('No instructions found.')
		end
		
		context "Upon providing the instructions" do
			
			before do
			  @controller.read_file('./test.txt')
			end
			
			it 'will start the execution of instructions' do
				expect(@controller.start).not_to be_nil
			end
		end
		
		
		context "Upon providing the file which contains invalid PLACE command" do
			
			before do
			  @controller.read_file('./test5.txt')
			end
			
			it 'will halt the execution' do
				expect{@controller.start}.to output("The file contains invalid instructions\n").to_stdout
			end
		end
		
	end
	
	describe '#process_instruction' do
		
		it 'will show warning if the robot is not placed yet' do
			expect(@controller.process_instruction('MOVE')).to eq('Robot is not placed yet.')
		end
		
		context 'the robot is placed but the instruction is invalid' do
			before do
			  @controller.is_placed = true
			end
			it 'will ignore the instruction and warn the user' do
				expect{@controller.process_instruction('MOVEME')}.to output("Invalid instruction ignored MOVEME\n").to_stdout
			end
		end
		
		context 'Rotate the robot to RIGHT' do
			before do
			  @controller.is_placed = true
			  @controller.table.place(0,0)
			  @controller.robot.place('NORTH')
			  @controller.process_instruction('RIGHT')
			end
			it 'will result from NORTH to EAST' do
				expect(@controller.robot).to have_attributes(:direction =>"EAST")
			end
		end
		
		context 'Rotate the robot to LEFT' do
			before do
			  @controller.is_placed = true
			  @controller.table.place(0,0)
			  @controller.robot.place('WEST')
			  @controller.process_instruction('LEFT')
			end
			it 'will result from WEST to SOUTH' do
				expect(@controller.robot).to have_attributes(:direction =>"SOUTH")
			end
		end
		
	end
	
	describe '#move' do
	
		it 'will show warning if the robot is not placed yet' do
			expect(@controller.move).to eq('Robot is not placed yet.')
		end 	
		
		
		context 'Upon providing the intial table position and initial robot direction' do
			before do
			  @controller.is_placed = true
			  @controller.table.place(0,0)
			  @controller.robot.place('NORTH')
			  @controller.move			  
			end
			
			it 'will move the robot on the table and update the x and y of the table' do
				expect(@controller.table).to have_attributes(:x =>0, :y => 1)
			end		
			
		end
		
		context 'Upon providing the intial table position and initial robot direction' do
			
			before do
			  @controller.is_placed = true
			  @controller.table.place(0,0)
			  @controller.robot.place('SOUTH')
			  @controller.move		  
			end
			
			it 'will simply ignore the move command if it will put the robot of the table' do
				expect(@controller.table).to have_attributes(:x =>0, :y => 0)
			end
		end
		
		describe '#report' do
		
			context "Upon providing the instructions and processing all of them" do
				
				before do
				  @controller.read_file('./test.txt')
				  @controller.start
				end
				
				it 'will show the final position of table and orientaion of the robot' do
					expect {@controller.report}.to output("3, 3, NORTH\n").to_stdout
				end
			end
			
		end
		
		
		
		
	end
	
	
	
	
end