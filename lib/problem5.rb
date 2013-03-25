class Integer
  def exp_of_in(n)
    rem, exp = n, 0
    loop do
      if rem % self == 0
        rem /= self
        exp += 1
      else
        return exp
      end
    end
    exp
  end
end
class EulerProblem
  #5. LCM [1,20]
  def p5
    (3..20).inject([[2, 0], [3,0]]) do |lcm_fact, n|

      #print "***** n = "
      #print n
      #print " *****\n"

      sqrt_n = Math.sqrt(n).round
      divisor_found = false

      lcm_fact.each_with_index.inject(lcm_fact) do |fact, ((p, exp), i)|
      # Find the prime factorization of n.
      # Update the LCM prime factorization with new primes, as they are discovered,
      # and new exponenets, so that each one at least equals the one for this n.
        #p, exp = p_exp[0], p_exp[1]

        #print "p = "
        #print p
        #print ", fact = "
        #print fact
        #print "\n"

        new_exp = p.exp_of_in(n)
        divisor_found = true if new_exp > 0
        fact[i] = [p, new_exp] if new_exp > exp
        
        if p > sqrt_n
          # Exponents of all relevant primes have been found--except that n may itself be prime.
          break(divisor_found ? fact : fact << [n, 1])
        end

        fact
      end

      if n == 20
        lcm_fact.inject(1) {|prod, (p, exp)| prod * (p ** exp)}
      else
        lcm_fact
      end

    end
  end
end


=begin

  #Find the maximum exponent of each prime.
  #That will be the exponent of that prime in the LCM.
  def isprime(i)
    # This function has side effects:
    # - build the $primes list
    # - build the structure of the $lcm_exps list with zeros
    s = Integer(Math.sqrt(i))
    for p in $primes
      if p > s
        if i > $primes.last
          $primes << i
  	      $lcm_exps << 0
        end
        return true
      elsif i % p == 0
        return false
      end
    end
  end
  def exp_of_in(p, n)
    rem = n
    exp = 0
    while rem % p == 0
      rem /= p
      exp += 1
    end
    return exp
  end

  def p5

  $primes = [2]
  $lcm_exps = [0]

  for i in (2..20)
    exps = []
    # For each prime up to i, find its exponent in i,
    # and udpade the $lcm_exps list to reflect it.
    for j in (2..i)
      if isprime(j)
        exps << exp_of_in(j, i)
        idx = exps.length - 1
        $lcm_exps[idx] = [$lcm_exps[idx], exps.last].max
      end
    end
  end
  $primes.zip($lcm_exps).map{|i, j| i ** j}.inject(:*)

  end
end

=end
