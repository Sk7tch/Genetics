require_relative 'genetics'

class EvalEigthQueens < Evaluator
	def initialize(board_size)
		@size = board_size
		@perfect_score = EvalEigthQueens.fn_score(@size, 0)
		@debug = false
	end
	
	def is_perfect?(individual)
		individual.score > 1.0
	end
	
	private
		
	def scoring_method(individual)
		board = individual.chromosomes
		diags_l = Array.new(@size)
		diags_r = Array.new(@size)
		nb_conflicts = (board.size - board.uniq.size)
		board.each_with_index do |col, row|
			diags_l[row] = (col - row)
			diags_r[row] = (row + col)
		end
		nb_conflicts += (diags_l.size - diags_l.uniq.size)		
		nb_conflicts += (diags_r.size - diags_r.uniq.size)
		EvalEigthQueens.fn_score(@size, nb_conflicts)		
	end
	
	def self.fn_score(size, n)
		1.0 / n
	end	
end
#----------------------------------------------------------------------
board_side = 8
population_size = 1000
genes = Genes.new((0...board_side).to_a)
evaluator = EvalEigthQueens.new(board_side)
generations = []
mutator = Mutator.new(0.01, 0.03)
population = Population.new(genes, population_size, board_side)
algo = Algorythm.new(population, evaluator, mutator, 1000)
generation = algo.run
#----------------------------------------------------------------------
puts "End in #{generation} for a population of #{population_size}"
mvp = (population.individuals.sort_by { |i| i.score }.reverse).first
puts "MVP is " + ((evaluator.is_perfect?(mvp)) ? "" : "not ") + "a perfect solution"
puts "SCORE :#{mvp.score}"
puts "-" * (board_side * 2)
board_side.times do |i|	
	line = ("| " * board_side) + "|"
	line[mvp[i]*2+1] = "O"
	bef = "_" * (board_side * 2)
	puts bef + "\n" + line
end


