#16. Sum of digits of 2^1000.
String(2**1000).split(//).map{|c| Integer(c)}.inject(:+)