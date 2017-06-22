# author: Mario Camara Neto  date: 22/06/2017  email: mariocamaraneto@gmail.com

# The prime 41, can be written as the sum of six consecutive primes:
# 	41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'prime'

primes_sum = [0]
limit = 10**6

#create array with all sums. Exemple: index 6 is equal to sum 6 first primes, 2+3+5+7+11+13 = 41
Prime.each_with_index(limit/2) { |pri, i| primes_sum << pri + primes_sum[i] }

max_terms=1
max_sum=0
#get all sequences possible and verify what is biggest sequence
primes_sum.each_with_index do |term_start, i|	
	primes_sum.drop(i+1).each_with_index do |term_end, j|
		sum_terms = term_end-term_start
		break if sum_terms > limit 
		if (Prime.prime? sum_terms) and (max_terms < j)
			max_terms=j
			max_sum=sum_terms
		end
	end
end
max_terms += 1  #fix the index to number of terms (index start in 0)

puts "The result is #{max_sum} with #{max_terms} terms."