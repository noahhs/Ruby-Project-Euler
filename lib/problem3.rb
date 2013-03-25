class EulerProblem
  #3. Largest prime factor of 600851475143.

  def p3
    find_largest_prime_factor 600851475143
  end

  private
  def find_largest_prime_factor(big_number)
    root = Math.sqrt(big_number).round

    2.upto(root) do |factor|
      next unless is_prime?(factor)

      big_number = big_number / factor if big_number % factor == 0

      return factor if big_number == 1
    end
  end

  def is_prime?(number)
    return false if number <= 1

    2.upto(Math.sqrt(number).round) do |divisor|
      return false if number % divisor == 0
    end

    return true
  end
end
