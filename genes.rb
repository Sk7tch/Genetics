module Genetics

	class Genes
		def initialize(genes)
			@genes = genes
			@size = @genes.size
		end
		
		def random
			@genes[rand(@size)]
		end
	end
end