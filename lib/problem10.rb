class EulerProblem
  #10. Sum of primes below 2 million.
  def p10
    primes = [2, 3]
    (5..2000000).step(2).each do |n|
      sn = Math.sqrt(n).round
      primes << n if primes.each do |p|
        break(false) if n % p == 0
        break(true) if p > sn
      end
    end

    primes.inject(:+)

  end
end
