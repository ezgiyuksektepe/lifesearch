class Planet 

	attr_reader :distance, :haveLife, :id, :planetType

	def initialize()

		@distance = rand(0...300000000)
	end
    
    def getDistance()
        return @distance
    end
    def getLife
    	return @haveLife
 	end
 	def getPlanetType
 		return @planetType
 	end
 	def getId()
 		return @id
 	end
 
end

class RockyPlanet < Planet

	#attr_reader :haveLife, :id

	def initialize()  
 
		@haveLife = 0
		@distance = super
		@planetType = "RockyPlanet"
		@id = "R-" + self.object_id.to_s

 	 end  

end

class HabitablePlanet < Planet

	#attr_reader :haveLife, :id

	def initialize()  

		@distance = super
		@planetType = "HabitablePlanet"
		@id = "H-" + self.object_id.to_s


 	 end  

 	 def setHaveLife(life)
 	 	@haveLife = life
 	 end
 		
end
 

class GaseousPlanet < Planet

	def initialize()  
 
		@haveLife = 0
		@distance = super
		@planetType = "GaseousPlanet"		
		@id = "G-" + self.object_id.to_s

 	 end  

end



