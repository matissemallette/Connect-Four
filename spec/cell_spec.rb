require 'RSpec'
require './lib/cell.rb'

RSpec.describe Cell do
	before(:each) do
		@cell = Cell.new(0, 1, '.')
	end

	it 'exists' do
		expect(@cell).to be_an_instance_of(Cell)
	end

	it 'has readable attributes' do
		expect(@cell.row).to eq(0)
		expect(@cell.column).to eq(1)
		expect(@cell.content).to eq('.')
	end

	it 'has writable attributes' do 
		cell2 = Cell.new(0, 0, '.')
		cell2.row = 4
		cell2.column = 3
		cell2.content = 'X'
		expect(cell2.row).to eq(4)
		expect(cell2.column).to eq(3)
		expect(cell2.content).to eq('X')
	end

	it 'does not have chip in it' do
		expect(@cell.empty?).to eq(true)
	end

	it 'has player chip in it' do
		cell2 = Cell.new(0, 0, 'X')
		expect(cell2.empty?).to eq(false)
	end

	it 'has computer chip in it' do
		cell2 = Cell.new(0, 0, 'O')
		expect(cell2.empty?).to eq(false)
	end
end