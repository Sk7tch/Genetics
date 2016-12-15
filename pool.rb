module Genetics
	
	class Pool
		
		def initialize(individuals)
			@individuals = []
			individuals.each do |indiv|
				indiv.fitness.to_i.times { @individuals << indiv.dup }
				@individuals << indiv if (indiv.fitness.to_i - indiv.fitness < rand)
			end
			@size = @individuals.size		
		end
		
		def get(n = 1)
			individuals = []
			n.times { individuals << @individuals[rand(@size)] }
			individuals
		end
	end	
end