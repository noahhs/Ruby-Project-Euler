class EulerProblem
  # 14. Which number under 1,000,000 produces the longest Collatz sequence?
  def p14
    lengths = (2..1000000).inject([0, 1]) do |result, n|
      iters, nk = 0, n
      while nk >= n
        nk = (nk.even? ? nk / 2 : 1 + 3 * nk)
        iters += 1
      end
      result << iters + result[nk]
    end
    lengths.index(lengths.inject(0) {|max_length, length| [max_length, length].max})
  end
end
