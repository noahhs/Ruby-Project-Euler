#17. Number of letters used when writing out (1..1000) in words.

# This is a bit silly, since it doesn't need any real computation.
def p17

ones_spelled = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens_spelled = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
tens_spelled = ["twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"]
hundred_spelled = "hundred"
thousand_spelled = "thousand"
and_spelled = "and"

# <1> thousand <2> hundred <and> <3> <4>
def word_length(set)
  set.map{|i| i.length}.inject(:+)
end
ones_and_tens_piece = (ones_spelled.length + 1) * (
  word_length(teens_spelled) +
  word_length(ones_spelled) * (tens_spelled.length + 1) +
  word_length(tens_spelled) * (ones_spelled.length + 1)
  )
hundred_piece = word_length(ones_spelled) * 100 + hundred_spelled.length * 900
and_piece = and_spelled.length * (900 - 9)
thousand_piece = thousand_spelled.length + ones_spelled[0].length
ones_and_tens_piece + hundred_piece + and_piece + thousand_piece

end