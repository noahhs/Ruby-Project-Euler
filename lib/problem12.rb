#12. First triangle number to have over 500 divisors.

primes=[2]
n=2
loop do
  # Build primes list.
  if n.odd?
    sn=Integer(Math.sqrt(n))
    primes.each do |p|
      if p>sn
        primes << n
        break
      end
      break if n%p==0      
    end
  end
  # Find t's prime divisors and their exponents.
  # Iterate through the primes up to sqrt(t).
  t=n*(n+1)/2
  st=Integer(Math.sqrt(t))
  exps=[]
  primes.each do |p|
    break if p>st
    # Either all prime divisors of t have been found, or t itself is prime.
    exp,rem=0,t
    while rem%p==0
      exp+=1
      rem/=p
    end
    exps<<exp
  end
  # Now update the number of divisors
  if (exps.map{|e| e+1}<<1).inject(:*) > 500
    puts t
    break
  end
  n+=1
end

