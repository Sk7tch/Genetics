require_relative 'genes'
require_relative 'individual'
require_relative 'population'
require_relative 'pool'
require_relative 'crossover'
require_relative 'mutator'
require_relative 'evaluator'
include Genetics

module Genetics
	class Algorythm
		
		def initialize(population, evaluator, mutator, max_gen = 1000)
			@evaluator = evaluator
			@population = population
			@mutator = mutator
			
			@last_best = nil
			@same_best = 0
			@best_individual = nil
			@max_gen = max_gen
		end
				
		def run
			@max_gen.times do |generation|	
				@population.mate(@mutator)				
				@best_individual = @evaluator.run(@population.individuals)
				handle_mutation_variation
				@last_best = @best_individual				
				return generation if @evaluator.is_perfect?(@best_individual)				
			end
			@max_gen
		end
		
		private
		
		def handle_mutation_variation
			if not @last_best.nil? and @last_best.score <= @best_individual.score
				@same_best += 1
				if @same_best > 5
					@same_best = 1
					@mutator.inc_rate
				end
			else
				@mutator.original_rate
			end
		end
	end
end

