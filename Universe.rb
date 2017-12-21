require_relative "Star"
require_relative "Planet"

class Universe
	attr_reader :stars, :d_Count, :g_Count, :m_Count #dwarf,giant,medium star counts
	
	def initialize(numofStars)
		@stars =[]
		(0..numofStars).each do
			type = rand(3)
			s = nil
			if type == 0
				s= DwarfStar.new
			elsif type == 1
				s= GiantStar.new
			else 
				s= MediumStar.new
			end
			@stars << s
		end
		@stars.sort! {|a,b|
			[a.x,a.y,a.z] <=> [b.x,b.y,b.z]
		}
		self.countStars(@stars)
	end

	def getD_Count
		return @d_Count
	end
	def getG_Count
		return @g_Count
	end
	def getM_Count
		return @m_Count
	end
	def getStars
		return @stars
	end

	def countStars(stars)
		size = stars.size
		i = 0
		d_Count=0
		g_Count=0
		m_Count=0
		while i < size
			if stars[i].getStarType().eql? "DwarfStar"
				d_Count = d_Count+1
				
			elsif stars[i].getStarType.eql? "GiantStar"
				g_Count = g_Count+1

			elsif stars[i].getStarType.eql? "MediumStar"
				m_Count = m_Count+1
			end

			i = 1+i
			@d_Count = d_Count
			@g_Count = g_Count
			@m_Count = m_Count

		end
	end


	def printUniverse()
		size = @stars.size
		i = 0
		d_Count=0
		g_Count=0
		m_Count=0

#dwarf
		d_habit=0
		d_gas=0 
		d_rock=0
		d_tmph=0
		d_tmpg=0
		d_tmpr=0
		d_l=0


#giant
		g_habit=0
		g_gas=0 
		g_rock=0
		g_tmph=0
		g_tmpg=0
		g_tmpr=0
		g_l=0

#medium
		m_habit=0
		m_gas=0 
		m_rock=0
		m_tmph=0
		m_tmpg=0
		m_tmpr=0
		m_l=0

		while i < size
			if @stars[i].getStarType().eql? "DwarfStar"
				d_Count = d_Count+1
				d_habit, d_gas, d_rock = stars[i].countPlanets(stars[i].getPlanets)
				d_l = stars[i].countLife(stars[i].getPlanets)
				d_tmph = d_tmph + d_habit
				d_tmpg = d_tmpg + d_gas
				d_tmpr = d_tmpr + d_rock


			elsif @stars[i].getStarType.eql? "GiantStar"
				g_Count = g_Count+1
				g_habit, g_gas, g_rock = stars[i].countPlanets(stars[i].getPlanets)
				g_l = stars[i].countLife(stars[i].getPlanets)
				g_tmph = g_tmph + g_habit
				g_tmpg = g_tmpg + g_gas
				g_tmpr = g_tmpr + g_rock
				
			elsif @stars[i].getStarType.eql? "MediumStar"
				m_Count = m_Count+1
				m_habit, m_gas, m_rock = stars[i].countPlanets(stars[i].getPlanets)
				m_l = stars[i].countLife(stars[i].getPlanets)
				m_tmph = m_tmph + m_habit
				m_tmpg = m_tmpg + m_gas
				m_tmpr = m_tmpr + m_rock
		
			end
			i = 1+i
		end

		puts "Total number of Stars in my universe is " + @stars.size.to_s

		puts "There are " + self.getG_Count().to_s + " Giant Stars with:"

			puts g_tmph.to_s+" Habitable Planets"
			puts g_tmpg.to_s+" Gaseous Planets"
			puts g_tmpr.to_s+" Rocky Planets"
			puts g_l.to_s + " Planets with Intelligent Life"
			puts ""


		puts "There are " + self.getM_Count().to_s + " Medium Stars with:"
			puts m_tmph.to_s+" Habitable Planets"
			puts m_tmpg.to_s+" Gaseous Planets"
			puts m_tmpr.to_s+" Rocky Planets"
			puts m_l.to_s + " Planets with Intelligent Life"			
			puts ""
	

		puts "There are " + self.getD_Count().to_s + " Dwarf Stars with:"
			puts d_tmph.to_s+" Habitable Planets"
			puts d_tmpg.to_s+" Gaseous Planets"
			puts d_tmpr.to_s+" Rocky Planets"	
			puts d_l.to_s + " Planets with Intelligent Life"
			puts ""			
			
	end
end
