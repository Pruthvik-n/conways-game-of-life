require 'pry'

class Cell
	attr_accessor :i,:j,:alive, :nextgen_alive
	def initialize(i,j,alive=false)
		@i = i	
		@j = j
		@alive = alive
	end
	
	def printcell
		if self.alive == true
			print "0"
		else
			print "-"
		end
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
		@cells = [[1,0,0],[0,1,0],[0,0,1]]		
	end

	def gamestate
		@cells.each do |row|
			row.each do |cell|
					binding.pry
			cell.nextgen_state? (check_neighbours(cell.i , cell.j))
			end
		end
		@cells.each {|row| row.each {|cell| cell.set_nextgen}}
	end

	def check_neighbours(i,j)
		@sum = 0	
		@neighbours.each do |neighbour_i, neighbour_j|
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

a = Game.new(2,2)
a.start
# p a.cells
# p "*"*80
# p a.cells.first
# p "*"*80
# p a.cells.first.first
# p "*"*80
# p a.cells.first.first.alive
# p a.check_neighbours(1,1)

