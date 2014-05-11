class MoneyCalculator
	attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands, :p_quantity
  
	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands, p_quantity)
		@ones = ones
		@fives = fives
		@tens = tens
		@twenties = twentoes
		@fifties = fifties
		@hundred = hundred
		@five_hundreds = five_hundreds
		@thousands = thousands
		@p_quantity = p_quantity
 	end
	
	def change
		@ones = ones.to_i
		@fives = fives.to_i
		@tens = tens.to_i
		@twenties = twenties.to_i
		@fifties = fifties.to_i
		@hundreds = hundreds.to_i
		@five_hundreds = five_hundreds.to_i
		@thousands = thousands.to_i
	end
end
