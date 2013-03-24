class EulerProblem
  #2. Sum of even-valued Fibonacci numbers less than or equal to 4000000.
  def p2
    last = 1
    current = 2
    sum = 1

    while current <= 4000000
      if current % 2 == 0
        sum += current
      end
      temp = last
      last = current
      current += temp
    end

    sum
  end
end
