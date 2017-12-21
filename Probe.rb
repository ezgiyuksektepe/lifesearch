=begin
Keeps track of the following information
starting coordinates +
id of planet discovered to have intelligent life +
total distance traveled  +
number of stars visited  +
number of planets explored  +
An algorithm to determine which Star you should visit next
A print method that prints the probe’s findings.
Has a fuel attribute that depletes during the search algorithm, and recharges using the recharge amount for each star
=end
require_relative "Universe"
#require_relative "Math"

class Probe 
	attr_reader :fuel, :coordinateX, :coordinateY, :coordinateZ, :numOfStarsVisited, :numOfPlanetsExplored, :totalDistanceTraveled
	def initialize(x,y,z)
		@fuel = 2**70
		@coordinateX = x
		@coordinateY = y
		@coordinateZ = z
	end
	def getX()
		return @coordinateX
	end
	def getY()
		return @coordinateY
	end
	def getZ()
		return @coordinateZ
	end
	def setX(x)
		@coordinateX = x
	end
	def setY(y)
		@coordinateY = y
	end
	def setZ(z)
		@coordinateZ = z
	end
	def setFuel(f)
		@fuel = f
	end
	def setNumOfPlanetsExplored(n)
		@numOfPlanetsExplored=n
	end
	def setTotalDist(dist)
		@totalDistanceTraveled=dist
	end
	def getNumP
		return @numOfPlanetsExplored	
	end

	def search(stars)
		size = stars.size
		i = 0
		num = 0
		@numOfStarsVisited = 0
		@numOfPlanetsExplored = 0
		travelDist = 0
		tmp = Probe.new(self.coordinateX,self.coordinateY,self.coordinateZ) #keep initial state & works


		while i < size

			distance = calculateDistance(self,stars[i])
			remainingFuel = @fuel - distance

			if remainingFuel > 0

				self.setFuel((remainingFuel + stars[i].getRechargeAmount))
				self.setX(stars[i].getCoordinateX())
				self.setY(stars[i].getCoordinateY())
				self.setZ(stars[i].getCoordinateZ())
				@numOfStarsVisited += 1
				travelDist = travelDist + distance

				#check the planets for each star
				j = 0
				while j < stars[i].getPlanets.size

					temp = stars[i].getPlanets

					if temp[j].getLife() == 1
						if (@fuel - calculateDistance(tmp,stars[i])) > 0
							@numOfPlanetsExplored += 1
							setFuel((@fuel - calculateDistance(tmp,stars[i])))
							puts "Found Life on " + temp[j].getId()
							puts ""

							break
						else
							puts "Failed on back home!"
							puts ""

							break
						end
					else
						@numOfPlanetsExplored += 1
					end
					j += 1
				end
			else
				puts "Crushed! Out of fuel!"
				puts ""

				break
			end
			
			i += 1
			setTotalDist(travelDist)
	    end
	    puts "=============================================================================================="
		puts "Your origin was ( " + @coordinateX.to_s + "," + @coordinateY.to_s + "," + coordinateZ.to_s + " )"
		puts "Traveled " + @totalDistanceTraveled.to_s + " miles"
		puts "You have " + @fuel.to_s + " remaining"
		puts "Visited " + @numOfStarsVisited.to_s + " stars"
		puts "Explored " + @numOfPlanetsExplored.to_s + " planets"
		puts ""
	end

	def calculateDistance(p,s)
		distance = Math.sqrt((p.getX - s.getCoordinateX)**2 + (p.getY - s.getCoordinateY)**2 + (p.getZ - s.getCoordinateZ)**2 )
		return distance
	end

end
