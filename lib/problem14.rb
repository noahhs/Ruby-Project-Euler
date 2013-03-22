# 14. Which number under 1,000,000 produces the longest Collatz sequence?
(1..1000000).inject([0, 0]) do |result, n|
  k, nk = 0, n
  while nk != 1
    k += 1
    if nk.even?
      nk /= 2
    else
      nk = 1 + 3 * nk
    end
  end
  result = [k,n] if k > result[0]
  result
end