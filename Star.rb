require_relative "Planet"

class Star

	attr_reader :x,:y,:z, :chanceOfLife, :numOfPlanets, :goldilocksZone, :rechargeAmount, :planets, :starType
	def initialize()
		 @x = rand(2**3...2**64)-1
		 @y = rand(2**3...2**64)-1
		 @z = rand(2**3...2**64)-1
	end  

	def getCoordinateX()
		return @x
	end
	def getCoordinateY()
		return @y
	end
	def getCoordinateZ()
		return @z
	end
	def getChanceOfLife()
		return @chanceOfLife
	end
	def getNumOfPlanets()
		return @numOfPlanets
	end
	def getRechargeAmount()
		return @rechargeAmount
	end
	def getPlanets()
		return @planets	
	end
	def getStarType()
		return @starType
	end

	def printPlanets(planets)
		size = planets.size
		i = 0
		while i < size
			puts planets[i].getId()
			puts planets[i].getLife()

			i = 1+i
		end
	end

	def countPlanets(planets)
		size = planets.size
		i = 0
		hCount =0
		gCount = 0
		rCount =0
		while i < size
			if planets[i].getPlanetType == "HabitablePlanet"
				hCount = hCount+1
				
			elsif planets[i].getPlanetType == "GaseousPlanet"
				gCount = gCount+1
			
			else
				rCount = rCount+1	
			end

			i = 1+i
		end
		return hCount,gCount,rCount
	end

	def countLife(planets)
		size = planets.size
		i = 0
		life = 0

		while i < size
			if planets[i].getLife == 1
				life += 1
			end
			return life
		end

	end

	def generatePlanets(num,starName)

		@planets = []
		(0...num).each do 
			type = rand(3)
			p = nil

			if type == 0
				p = GaseousPlanet.new

			elsif type == 1
				p = HabitablePlanet.new
				if starName.eql? "DwarfStar" 
					if (rand(10000) <= 6) && (30000000<p.getDistance()) && (p.getDistance()<90000000)
						p.setHaveLife(1)
					else
						p.setHaveLife(0)
					end

				elsif starName.eql? "GiantStar" 
					if (rand(10000) <= 5) && (100000000<p.getDistance()) && (p.getDistance()<250000000)
						p.setHaveLife(1)
					else
						p.setHaveLife(0)
					end

				elsif starName.eql? "MediumStar" 
					if (rand(10000) <= 9) && (60000000<p.getDistance()) && (p.getDistance()<140000000)
						p.setHaveLife(1)
					else
						p.setHaveLife(0)
					end
							
				else
					p.setHaveLife(0)
					end
			else
				p = RockyPlanet.new
			end
			@planets<<p
		end
		self.countPlanets(@planets)
		return @planets
	end



end

class DwarfStar < Star

	def initialize()
		@x = super
		@y = super
		@z = super
		@chanceOfLife = 0.0006
		@numOfPlanets = rand(8...15)
        @goldilocksZone = rand(30000000...90000000)
        @rechargeAmount = 2**20
        @starType = "DwarfStar"
       # self.printPlanets(generatePlanets(self.numOfPlanets,DwarfStar))
        generatePlanets(self.numOfPlanets, DwarfStar)
    end


end

class GiantStar < Star

	def initialize()
		@x = super
		@y = super
		@z = super
		@chanceOfLife = 0.0005
		@numOfPlanets = rand(5...10)
        @goldilocksZone = rand(100000000...250000000)
        @rechargeAmount = 2**30
        @starType = "GiantStar"
		#self.printPlanets(generatePlanets(self.numOfPlanets,GiantStar))
        generatePlanets(self.numOfPlanets,GiantStar)

    end

end

class MediumStar < Star

	def initialize()
		@x = super
		@y = super
		@z = super
		@chanceOfLife = 0.0009
		@numOfPlanets = rand(2...9)
        @goldilocksZone = rand(60000000...140000000)
        @rechargeAmount = 2**25
        @starType = "MediumStar"
      	#self.printPlanets(generatePlanets(self.numOfPlanets,MediumStar))
        generatePlanets(self.numOfPlanets,MediumStar)        
    end

end



