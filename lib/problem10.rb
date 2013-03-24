class EulerProblem
  #10. Sum of primes below 2 million.
  def p10
    primes = [2]

    999998.times do |j|
      i = 2 * j + 3
      s = Integer(Math.sqrt(i))
      catch (:next) do
        primes.each do |p|
          throw :next if i % p == 0
          if p > s
            primes << i
            throw :next
          end
        end
      end
    end

    primes.inject(:+)
  end
end
