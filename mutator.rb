module Genetics

	class Mutator	
		def initialize(mutation_rate, increment = 0.01)
			@mutation_rate = mutation_rate
			@original_rate = mutation_rate
			@increment = increment
		end
	
		def mutate(individual, genes)
			individual.size.times do |index| 
				individual[index] = genes.random if rand < @mutation_rate
			end
			individual
		end
		
		def inc_rate			
			@mutation_rate += @increment
		end
		
		def original_rate			
			@mutation_rate = @original_rate
		end
	end
end