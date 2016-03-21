require 'spec_helper'

describe 'Robot' do

	before :all do
		@robot = Robot.new
	end
	
	describe '#place' do
		
		it 'sets the initial orientation of the robot' do
			expect(@robot.place('WEST')).not_to be_nil
		end
		
		it 'will fail on providing the orientation other than WEST, NORTH, EAST, SOUTH' do
			expect(@robot.place('NORTHY')).to be_nil
		end
		
		
	end
	
	describe '#left' do
		
		context 'the robot is facing NORTH' do 
		
			before do
				@robot.place('NORTH')
			end
			
			it 'will face WEST' do
				expect(@robot.change_direction('LEFT')).to eq('WEST')
			end
			
		end
		
		
		context 'the robot is facing SOUTH' do 
		
			before do
				@robot.place('SOUTH')
			end
			
			it 'will face EAST' do
				expect(@robot.change_direction('LEFT')).to eq('EAST')
			end
			
		end
		
		
		context 'the robot is facing EAST' do 
		
			before do
				@robot.place('EAST')
			end
			
			it 'will face NORTH' do
				expect(@robot.change_direction('LEFT')).to eq('NORTH')
			end
			
		end
		
		context 'the robot is facing WEST' do 
		
			before do
				@robot.place('WEST')
			end
			
			it 'will face SOUTH' do
				expect(@robot.change_direction('LEFT')).to eq('SOUTH')
			end
			
		end
	
	end
	
	
	describe '#right' do
		
		context 'the robot is facing NORTH' do 
		
			before do
				@robot.place('NORTH')
			end
			
			it 'will face EAST' do
				expect(@robot.change_direction('RIGHT')).to eq('EAST')
			end
			
		end
		
		
		context 'the robot is facing SOUTH' do 
		
			before do
				@robot.place('SOUTH')
			end
			
			it 'will face WEST' do
				expect(@robot.change_direction('RIGHT')).to eq('WEST')
			end
			
		end
		
		
		context 'the robot is facing EAST' do 
		
			before do
				@robot.place('EAST')
			end
			
			it 'will face SOUTH' do
				expect(@robot.change_direction('RIGHT')).to eq('SOUTH')
			end
			
		end
		
		context 'the robot is facing WEST' do 
		
			before do
				@robot.place('WEST')
			end
			
			it 'will face NORTH' do
				expect(@robot.change_direction('RIGHT')).to eq('NORTH')
			end
			
		end
	
	end
	
	

end