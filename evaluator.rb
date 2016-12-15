module Genetics

	class Evaluator	
		def run(individuals)
			@individuals = individuals			
			best = score
			fitness
			best
		end
		
		# return true/false
		def is_perfect?(individual)
			false
		end
		
		private
		
		# return int , score from individual
		def scoring_method(individual)
			raise "Evaluator.scoring_method should be defined"
		end
		
		def score
			best = nil
			@individuals.each do |individual|
				individual.score = scoring_method(individual)
				best = individual if best.nil? or best.score < individual.score
			end
			best
		end
		
		def fitness
			total = @individuals.inject(0) { |sum, x| sum += x.score }
			if total > 0
				@individuals.each { |individual| individual.fitness = individual.score.to_f / total * 100 }
			end
		end
	end
end