module Genetics

	class Population
		attr_reader :individuals
	
		def initialize(genes, population_size, chromosomes_size, mating_method = "universal")
			@individuals = []
			@population_size = population_size
			@genes = genes
			@chromosomes_size = chromosomes_size
			@population_size.times { @individuals << Individual.random(genes, chromosomes_size) }			
			@mating_method = mating_method
			@mating_method = "universal" if not Crossover.respond_to?(mating_method) and ["one_point", "two_point", "universal"].include? mating_method
		end
				
		def mate(mutator)			
			pool = Pool.new(@individuals)			
			cross = Crossover.new(@genes, mutator, @chromosomes_size)
			@individuals.clear
			@population_size.times do
				parent_a, parent_b = pool.get(2)
				@individuals << cross.public_send(@mating_method, parent_a, parent_b)
			end
		end
		
		def to_s
			t = []
			@individuals.each { |i| t << "[#{i.score}][#{'%.2f' % i.fitness}]=#{i.chromosomes.inspect}"}
			t.join("\r\n")
		end
	end
end