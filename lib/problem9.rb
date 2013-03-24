class EulerProblem
  #9. Find the product of the Pythagorean triple whose sum is 1000.
  def p9
    prod = 0

    catch (:done) do
      (2..999).each do |b|
        (1..b - 1).each do |a|
          c = 1000 - a - b
          if c ** 2 == a ** 2 + b ** 2
            prod =  a * b * c
            throw :done
          end
        end
      end
    end

    prod
  end
end
