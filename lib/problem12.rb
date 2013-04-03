  #12. First triangle number to have over 500 divisors.
class Array
  def add_next_prime!
    n = self.last + 2
    
    # Continue checking successive n until a new prime is found.
    new_prime = loop do
      sn = Math.sqrt(n).round
      
      # Check each prime up to sqrt(n) to see if it divides n
      is_prime = self.each do |p|
        break(true) if p > sn
        break(false) if n % p == 0
      end
      
      break(n) if is_prime
      n +=2
    end

    self << new_prime
  end
end

class Integer
  
  def factorization(primes)
    # Adding a p > sqrt(rem) check might optimize.
    rem = self
    primes.inject([]) do |result, p|
      break(result) if rem == 1
      exp = 0
      while rem % p == 0
        exp += 1
        rem /= p
      end
      result << exp
    end
  end

  def triangular?
    n = Math.sqrt(self * 2).floor
    n * (n + 1) / 2 == self
  end

end

class Integer
  def num_divisors(primes)
    self.factorization(primes).inject(1) do |result, exp|
      result * (exp + 1)
    end
  end
end

class EulerProblem
  def p12
    
    # First, build some primes
    primes = [2,3]
    (1..10000).each do |_|
      primes.add_next_prime!
    end

    n = 1

    # Now check the factorization of each t to see if it has 500 divisors.
    loop do
      t = n * (n + 1) / 2
      break(t) if t.num_divisors(primes) > 500
      n += 1
    end

  end  
end

# We are done iterating on this problem.
# But keeping some of the discussion around, for posterity.

=begin
  Here we go again. Hopefully for the last time.
  A little exploratory testing goes a long way.
  The prime factorization of the solution (76575600) is:

  [2, 2, 3, 1, 1, 1, 1]

  This is a very approachable number, which can be produced quickly by any number of algorithms
  which run through factorizations in turn,
  checking them for number of divisors, size, and triangularity,
  and reporting the smallest that satisfies.

  The problem is knowing when to terminate. We could just use a heuristic based on the known answer,
  but that is cheating. We want an algorithm that essentially proves the correctness of the result,
  by implicitly ruling out other possibilities. Checking triangular numbers from 1 upwards does this,
  but we seek a faster solution.

  We need to rule out:
  - higher exponents
  - longer lists of primes

  based on their failure to satisty one of the conditions, (divisors, size, triangularity).

  after we have found a solution, we need to ask: what others might be smaller?

  Factorizations in which every exponent is larger is clearly ruled out.
  We can easily run through only those factorizations in which at least one exponent is smaller,
  up to a certain length of primes list. But how do we cap the list?
  To play devil's advocate: isn't there just one prime out there that, if we include it,
  will allow the other exponents to be smaller?  

  Or to take another tack: we've found this triangular number. Consider its (n, n+1) pair.
  Isn't there a smaller n whose triangular number has at least 500 divisors?
=end



=begin
  Discussion.
  Optimizing this problem to under 1 second has proven difficult.
  Let's try one more approach.
  Find the lowest number with greater than 500 divisors.
  Then increment from there, until we find a triangular number.

  For a given list of primes factors, find the lowest number composed of those factors
  that has over 500 divisors. Then expand the list of primes, and repeat.
=end

=begin


=begin
      Let's talk through this recursion.
      Start with the whole exponents list of the partial primes list.
      Let the last exponent be zero,
      and make the remainder of the exponents list,
      such that it represents the lowest 500-divisor number on those exponents.
      Then increment the last exponent, and check the rest of the list again.
      Then check the rest of the list again, this time to look for the lowest number with only 250 divisors.
=end



=begin
  What would be helpful is to further break down the problem.
  Before evaluating the size of numbers returned by each combination of exponents,
  we first need merely to know what values on each exponent will yield d divisors.
  That does not depend on the primes in question, but simply on how many there are.
  So it's like asking, "given n numbers, what are all the ways they can multiply to d?"
  For 2 numbers, and d = 50, the answer is:
  
  50 1
  25 2
  10 5
  5 10
  25 2
  50 1

  For 3 numbers, and d = 18, the answer is:

  18  1  1
   9  2  1
   6  3  1
   3  6  1
   2  9  1
   1 18  1
   9  1  2
   3  3  2
   1  9  2
   6  1  3
   3  2  3
   2  3  3
   1  6  3
   3  1  6
   1  3  6
   2  1  9
   1  2  9
   1  1 18

  To put it another way, we need the factorization of d. In the last case, that is [1 2].
  So we can rewrite the above example as:

  [1 2][0 0][0 0]
  [0 2][1 0][0 0]
  [1 1][0 1][0 0]
  [1 0][0 2][0 0]
  [0 0][1 2][0 0]
  [0 2][0 0][1 0]
  [0 1][0 1][1 0]
  [0 0][0 2][1 0]
  ...

  ...and so on. We are generating each way 2 blue balls and 1 red ball
  can be distributed in 3 distinct buckets. Those distributions are independent,
  so the answer is the product of the two!

  From Google, we have: 
  "There are C(n + k − 1, k) different ways to distribute k indistinguishable balls
  into n distinguishable boxes, without exclusion."
  http://www.elcamino.edu/faculty/gfry/210/DistributeBallsBoxes.pdf

  So, bringing it back to the problem at hand.
  For a list of n primes, satisfying the requirement of a d divisor number,
  let's say the factorizaiton of d is [e1 e2 ... ek].
  Then the number of solutions...

  ...oh. We are not looking for d-divisor numbers. We are looking for *at least* d divisors.
  If d is, say, a prime number, then numbers that have exactly that many divisors will be
  restricted to the form p ** d. Obviously much higher than what we could get with greater than d divisors.

  We're back to the algorithm. Trying ways to make it iterative rather than tree-recursive.
  Tree recursion is not going to work.

  The algorithm will look something like this.
  Let the primes-exponents be abstracted to an array of counters, each starting at 1.
  Start at the first counter, and increment to 2.
  Find increment each successive counter to 2, until you get a product of 500.
  Referencing the list of primes, find the 500-divisor number corresponding to this set of counter-values.
  Then increment the first counter to 3, and zero the rest of the counters.
  Increment the

  2  3  5  7 11 13 17 19 23
  2  2  2  2  2  2  2  2  2 = 512 div, n = 223092870
  3  2  2  2  2  2  2  2  2 = 768 div, n = 446185740
  3  3  2  2  2  2  2  2    = 576 div, n = 58198140
  3  3  3  2  2  2  2  2    = 864 div, n = 290990700
  3  3  3  3  2  2  2       = 648 div, n = 107207100
  3  3  3  3  3  2  2       = 972 div, n = 1179278100
  3  3  3  3  3  3          = 729 div, n = 901800900
  4  2  2  2  2  2  2  2    = 512 div, n = 38798760


=end

