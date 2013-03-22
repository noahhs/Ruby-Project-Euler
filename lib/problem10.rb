#10. Sum of primes below 2 million.
primes = [2]
1000000.times do |j|
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

