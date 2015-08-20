require 'pry'

class Cell
	attr_accessor :i,:j,:alive, :nextgen_alive
	def initialize(i,j,alive=false)
		@i = i	
		@j = j
		@alive = alive
	end
	
	def nextgen_state?(sum)
	if @alive == true	
		if [2,3].include? sum
			@nextgen_alive = true
		else
			@nextgen_alive = false
		end
	else
		if sum == 3
			@nextgen_alive = true
		else
			@nextgen_alive = false
		end
	end
	end
	
	def set_nextgen
		self.alive = @nextgen_alive
		@nextgen_alive = nil 
	end
end

class Game

	attr_accessor :row,:col,:cells

	def initialize(row,col)
		@row = row
		@col = col
		@cells = Array.new(row) { |i| Array.new(col) { |j| Cell.new(i,j) } }		
		@neighbours = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
		@cells = [[1,2,3],[4,5,6],[7,8,9]]
		# p @cells
		# binding.pry
	end

	def gamestate
		p @cells
		@cells.each_with_index do |row,indexr|
			row.each_with_index do |cell,indexc|
			
			cell.nextgen_state? check_neighbours(cell.i , cell.j)
			p cell.i
			get
		
			# cell.set_nextgen
			end
		end
		# @cells.each {|row| row.each {|cell| cell.set_nextgen}}
		# @cells.each do |row|
		# 	row.each do |cell|
		# 	p cell
		# 	p cell.nextgen_alive

		# 	end
		# end

	end

	def check_neighbours(i,j)
		@sum = 0	
		p @cells

		@neighbours.each do |neighbour_i, neighbour_j|
			# p @cells[neighbour_i + i][neighbour_j + j]
			if (@cells[neighbour_i + i][neighbour_j + j]).alive
				@sum+=1
			end
		end
		@sum	
	end

  	def start
		# for i in 1..5
			# system('clear')
			# puts self.printarray
			gamestate
			sleep(0.5)
		# end
	end
end

a = Game.new(3,3)
a.start
# p a.cells
# p "*"*80
# p a.cells.first
# p "*"*80
# p a.cells.first.first
# p "*"*80
# p a.cells.first.first.alive
# p a.check_neighbours(0,0)

