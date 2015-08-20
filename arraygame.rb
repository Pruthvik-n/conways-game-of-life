# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


def printarray(arr)
 	0.upto(arr.length-1) do |i|
		0.upto(arr.length-1) do |j|
		 print arr[i][j]+" "
	end
		 puts "\n"
	end
end
	
def game(arr,times)

min=0
max=arr.length-1

for i in 1..times
	
	new_a = Array.new(max+1) { Array.new(max+1) { |i| i='-' }  }
	sleep(0.5)

	
		0.upto(max) do |i|
			0.upto(max) do |j|
				count=0;
		# ------NEIGHBOUR CONDITIONS i=max j=min---------
				if i==max && j==min
					if arr[i-1][j] == '0'
						count+=1
					end
					if arr[i-1][j+1] == '0'
						count+=1
					end
					
					if arr[i][j+1] == '0'
						count+=1
					end

		#------NEIGHBOUR CONDITIONS i=max j=max---------
				elsif i==max && j==max
					if arr[i-1][j-1]=='0'
						count+=1
					end
					if arr[i-1][j] == '0'
						count+=1
					end
					if arr[i][j-1] == '0'
						count+=1
					end
								

		# ------NEIGHBOUR CONDITIONS i=max---------
				elsif i==max && j!=min && j!=max	
					if arr[i-1][j-1]=='0'
						count+=1
					end
					if arr[i-1][j]=='0'
						count+=1
					end
					if arr[i-1][j+1]=='0'
						count+=1
					end
					if arr[i][j-1]=='0'
						count+=1
					end
					if arr[i][j+1]=='0'
						count+=1
					end
				
		# ------NEIGHBOUR CONDITIONS i=min j=min---------
				elsif i==min && j==min
					if arr[i][j+1]=='0'
						count+=1
					end	
					if arr[i+1][j]=='0'
						count+=1
					end
					if arr[i+1][j+1]=='0'
						count+=1
					end

		#------NEIGHBOUR CONDITIONS i=min j=max---------
				elsif i==min && j==max
					
					if arr[i][j-1]=='0'
						count+=1
					end
					
					if arr[i+1][j-1]=='0'
						count+=1
					end
					if arr[i+1][j]=='0'
						count+=1
					end
					
				

		# ------NEIGHBOUR CONDITIONS i=min---------
				elsif i==min && j!=min && j!=max
					if arr[i][j-1]=='0'
						count+=1
					end
					if arr[i][j+1]=='0'
						count+=1
					end
					if arr[i+1][j-1]=='0'
						count+=1
					end
					if arr[i+1][j]=='0'
						count+=1
					end
					if arr[i+1][j+1]=='0'
						count+=1
					end
				
		# ------NEIGHBOUR CONDITIONS j=min---------
				elsif j==min && i!=min && i!=max 
					if arr[i-1][j]=='0'
						count+=1
					end
					if arr[i-1][j+1]=='0'
						count+=1
					end
				
					if arr[i][j+1]=='0'
						count+=1
					end
				
					if arr[i+1][j]=='0'
						count+=1
					end
					if arr[i+1][j+1]=='0'
						count+=1
					end
				
		# ------NEIGHBOUR CONDITIONS j=max---------
				elsif	j==max && i!=min && i!=max
					if arr[i-1][j-1]=='0'
						count+=1
					end
					if arr[i-1][j]=='0'
						count+=1
					end
					
					if arr[i][j-1]=='0'
						count+=1
					end
					
					if arr[i+1][j-1]=='0'
						count+=1
					end
					if arr[i+1][j]=='0'
						count+=1
					end
				

		#------NEIGHBOUR CONDITIONS REGULAR---------
				else
					if arr[i-1][j-1]=='0'
						count+=1
					end
					if arr[i-1][j]=='0'
						count+=1
					end
					if arr[i-1][j+1]=='0'
						count+=1
					end
					if arr[i][j-1]=='0'
						count+=1
					end
					if arr[i][j+1]=='0'
						count+=1
					end
					if arr[i+1][j-1]=='0'
						count+=1
					end
					if arr[i+1][j]=='0'
						count+=1
					end
					if arr[i+1][j+1]=='0'
						count+=1
					end
				end
		# --------RULES-------------------------  	
				# puts count
				if arr[i][j]=='-'
					if count==3
						new_a[i][j]='0'
					end
				
				elsif arr[i][j]=='0'
					if
						count<2 || count>3
						new_a[i][j]='-'
					elsif 
						count==2 || count==3
						new_a[i][j]=arr[i][j]
					end
				end
			end
		end
	system('clear')
	printarray(new_a)	
	arr = new_a
	
	end

end

a = [['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','0','-','-','-','-','-','-','-','-','-','0','-','-','-','-','-'],
		 ['-','0','0','-','-','-','-','-','-','-','-','0','0','-','-','-','-'],
		 ['-','-','0','0','-','-','-','0','-','-','-','-','-','-','0','0','-'],
		 ['-','-','0','0','-','-','-','0','0','-','-','-','-','-','-','0','-'],
		 ['-','-','0','0','-','-','-','0','0','0','-','-','-','-','-','-','-'],
		 ['0','0','-','-','-','-','-','-','0','-','-','-','-','-','-','-','-'],
		 ['0','-','-','-','-','-','-','0','-','-','-','-','-','-','-','0','-'],
		 ['-','-','-','0','-','-','-','0','-','-','-','-','-','-','-','-','-'],
		 ['-','-','0','0','-','-','-','-','-','-','-','-','0','0','-','-','-'],
		 ['-','-','-','-','-','0','0','-','-','-','-','-','0','0','0','-','-'],
		 ['-','0','0','-','-','0','0','-','0','-','-','-','0','-','-','0','-'],
		 ['0','0','0','-','-','0','0','0','-','-','-','0','0','0','-','0','0'],
		 ['-','-','0','0','-','-','-','0','0','-','-','-','-','-','-','0','0'],
		 ['-','-','0','0','-','-','-','0','0','-','-','-','-','0','-','-','-'],
		 ['-','-','-','-','-','0','0','-','-','-','-','-','-','0','-','-','-']]


b=[['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','0','0','0','-','-','-','0','0','0','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','-','-','0','0','0','-','-','-','0','0','0','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','0','0','0','-','-','-','0','0','0','-','-','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','0','-','-','-','-','0','-','0','-','-','-','-','0','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','0','0','0','-','-','-','0','0','0','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
		 ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']]


system('clear')
printarray(b)
sleep(0.8)
game(b,100)
puts ""
puts "Game ended"




