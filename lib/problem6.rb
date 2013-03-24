#6. Difference between square of sum and sum of squares of 1 to 100.
def p6

(1..100).inject(:+) ** 2 - (1..100).map{|i| i * i}.inject(:+)

end