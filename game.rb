require 'pry'

class Cell
	attr_accessor :i,:j,:alive, :nextgen_alive, :cell_number
	def initialize(i,j,alive=false)
		@i = i	
		@j = j
		@alive = alive
	end
	
	def nextgen_state?(sum)
		if self.alive == true	
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

	attr_accessor :row,:col,:cells,:pattern

	def init_pattern(pattern)
		@pattern = pattern
		@pattern.each do |p_i,p_j|
			@cells[p_i][p_j].alive = true
		end
	end

	def initialize(row,col)
		@row = row
		@col = col
		@cells = Array.new(row) { |i| Array.new(col) { |j| Cell.new(i,j) } }		
		@neighbours = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
	end
	
	def is_positive?(num) 
  		num.to_s.match(/\A[+]?\d+?\Z/) == nil ? false : true
  	end	

  	def printcells
  		@cells.each do |row|
  			row.each do |cell|
  				if cell.alive 
  					print "0 "
  				else
  					print "- "
  				end
  			end
  			puts ""
  		end			
  	end		
	
	def gamestate
		@cells.each do |row|
			row.each do |cell|
			cell.nextgen_state? check_neighbours(cell.i , cell.j)
			end
		end
		@cells.each do |row|
			row.each do |cell|
				cell.set_nextgen
			end
		end
	end

	def check_neighbours(i,j)
		@sum = 0	
		@neighbours.each do |neighbour_i, neighbour_j|
			if is_positive?(neighbour_i+i) && is_positive?(neighbour_j+j) && (neighbour_j+j)<@col && (neighbour_i+i)<@row && (@cells[neighbour_i + i][neighbour_j + j]).alive 
				@sum += 1
			end
		end
		@sum	
	end

  	def start(times)
		for i in 1..times
			system('clear')
			printcells
			gamestate
			sleep(0.1)
		end
	end
end

puts "Enter the number of generations "
times = gets.chomp.to_i

a = Game.new(35,45)
gosper_glider = [[9,13],[9,14],
				[8,12],[8,16],
				[7,11],[7,17],[7,25],
				[6,1],[6,2],[6,11],[6,15],[6,17],[6,18],[6,23],[6,25],
				[5,1],[5,2],[5,11],[5,17],[5,21],[5,22],
				[4,21],[4,22],[4,35],[4,36],[4,12],[4,16],
				[3,13],[3,14],[3,21],[3,22],[3,35],[3,36],
				[2,23],[2,25],
				[1,25]]

unknown = [[15,14],[15,15],[15,16],[15,17],
			[16,15],[16,16],[16,17],
			[17,15],[17,16],[17,17],
			[18,15],[18,16],[18,17]]
a.init_pattern(gosper_glider)
a.start(times)
