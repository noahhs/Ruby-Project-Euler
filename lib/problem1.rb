#1. Sum of multiples of 3 or 5 below 1000.

n=1
sum=0
while n<1000
  if n%3==0 or n%5==0
    sum+=n
  end
  n+=1
end
puts sum

