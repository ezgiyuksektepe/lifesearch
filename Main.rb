require_relative "Universe"
require_relative "Probe"


class Main

	universe = Universe.new(2**10)
	universe.printUniverse()
	probe=Probe.new(universe.getStars[1].getCoordinateX, universe.getStars[1].getCoordinateY, universe.getStars[1].getCoordinateX)
	probe.search(universe.getStars())

end
