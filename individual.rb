module Genetics
	class Individual
		attr_accessor :score
		attr_accessor :fitness
		attr_reader :chromosomes
		attr_reader :size
			
		def initialize(chromosomes)
			@chromosomes = chromosomes
			@score = 0
			@fitness = 1
			@size = chromosomes.size
		end
		
		def self.random(genes, size)			
			rand_chromosomes = []
			size.times { rand_chromosomes << genes.random }			
			new(rand_chromosomes)
		end
				
		def [](index)
			@chromosomes[index]
		end
		
		def []=(index, value)
			@chromosomes[index] = value
		end
	end

end