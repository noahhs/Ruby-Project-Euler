#7. The 10001st prime.
def isdivided(n,a)
  sn = Integer(Math.sqrt(n))
  a.each do |p|
    return true if n % p == 0
    return false if p >= sn
  end
end
primes=[2, 3]
n = 3
primes << n if not isdivided(n += 2, primes) while primes.length < 10000

