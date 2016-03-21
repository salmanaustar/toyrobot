require 'spec_helper'

describe 'IO_Helper' do

	describe '#read_file' do
	
		it 'will read the file and return array of instructions' do
			expect(IOHelper.read_file('../../test.txt')).to be_a(Array)
		end
		
		it 'will raise exception if wrong file name/path provided' do
			expect{IOHelper.read_file('test1.txt')}.to raise_error(Exception)
		end
		
	end
	

end