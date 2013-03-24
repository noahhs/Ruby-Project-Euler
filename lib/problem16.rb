class EulerProblem
  #16. Sum of digits of 2 ^ 1000.
  def p16
    String(2 ** 1000).split(//).map{|c| Integer(c)}.inject(:+)
  end
end
