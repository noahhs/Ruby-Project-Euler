#4. Largest palindrome made from the product of two three-digit numbers.
i=100
j=100
highest=0
while i<1000
  while j<1000
    prodstr=String(i*j)
    if prodstr==prodstr.reverse
        highest=[highest,i*j].max
    end
    j+=1
  end
  i+=1
  j=100
end
highest

