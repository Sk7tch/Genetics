module Genetics
	
	class Crossover
		
		def initialize(genes, mutator, chromosome_size)
			@mutator = mutator
			@chromosome_size = chromosome_size
			@genes = genes
		end
		
		def one_point(parent_a, parent_b)			
			point = rand(@chromosome_size)
			left_a, right_a = parent_a[0...point], parent_a[point..-1]
			left_b, right_b = parent_b[0...point], parent_b[point..-1]			
			@mutator.mutate(Individual.new(left_a.concat(right_b)), @genes)			
		end
		
		def two_point(parent_a, parent_b)			
			point_a = rand(@chromosome_size)
			point_b = rand(@chromosome_size - point_a) + point_a
			left_a, middle_a, right_a = parent_a[0...point_a], parent_a[point_a...point_b], parent_a[point_b..-1]
			left_b, middle_b, right_b = parent_b[0...point_a], parent_b[point_a...point_b], parent_b[point_b..-1]
			@mutator.mutate(Individual.new(left_a.concat(middle_b).concat(right_a)), @genes)
		end
		
		def universal(parent_a, parent_b)
			childs = []
			chromosome_a = parent_a.chromosomes
			chromosome_b = parent_b.chromosomes
			chromosome = []
			@chromosome_size.times do |idx|
				chromosome << ((rand < 0.5) ? parent_a[idx] : parent_b[idx])
			end
			@mutator.mutate(Individual.new(chromosome), @genes)
		end
	end
	
end