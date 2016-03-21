require 'spec_helper'

describe 'Table' do

	before :all do
		@table = Table.new(5,5)
	end
	
	describe '#place' do
		context 'upon providing the command' do
			it 'place coordinates in bounds' do
				expect(@table.place(4,0)).not_to be_nil
			end
			
			it 'does not allow index out of bounds of 5x5 array' do
				expect(@table.place(-1,0)).to be_nil
				expect(@table.place(5,0)).to be_nil
				expect(@table.place(5,5)).to be_nil
				expect(@table.place(4,5)).to be_nil
			end
			
		end
	end
	
	it 'takes height and width parameters' do
	end
end
