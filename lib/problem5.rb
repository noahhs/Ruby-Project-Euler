class EulerProblem
  #5. LCM [1,20]

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
