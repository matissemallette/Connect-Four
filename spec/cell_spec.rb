require 'RSpec'
require './lib/cell.rb'

RSpec.describe Cell do
	before(:each) do
		@cell = Cell.new('.')
	end

	it 'exists' do
		expect(@cell).to be_an_instance_of(Cell)
	end

	it 'has readable attributes' do
		expect(@cell.content).to eq('.')
	end

	it 'has writable attributes' do 
		cell2 = Cell.new('.')
		cell2.content = 'X'
		expect(cell2.content).to eq('X')
	end

	it 'does not have chip in it' do
		expect(@cell.empty?).to eq(true)
	end

	it 'has player chip in it' do
		cell2 = Cell.new('X')
		expect(cell2.empty?).to eq(false)
	end

	it 'has computer chip in it' do
		cell2 = Cell.new('O')
		expect(cell2.empty?).to eq(false)
	end
end