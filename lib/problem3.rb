#3. Largest prime factor of 600851475143.

$primes=[2]
def isprime(i)
  s=Integer(Math.sqrt(i))
  for p in $primes
    if p>s
      if i>$primes.last
        $primes << i
      end
      return true
    elsif i%p == 0
      return false
    end
  end
end
num=600851475143
s=Integer(Math.sqrt(num))
n=2
rem=num
largest=0
while n<=s
  if isprime(n)
    if rem%n == 0
      largest=n
      rem/=n
    elsif n==2
      n+=1
    else
      n+=2
    end
  else
    n+=2
  end
end
largest

