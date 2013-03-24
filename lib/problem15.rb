class EulerProblem
  # How many lattice paths are there through an 20x20 grid?
  def p15
    "
    Problem analysis. Let's generalize to n x n.
    There are n+1 places a horizontal movement can go: (before first vertical movement..after final vertical movement).
    The n horizontal movements need to be distributed into these buckets. How is this counted?

    This is looking like a closed-form solution, not a computation.

    A quick google search reveals that there are C(n + k - 1, k) ways to distribute k identicall balls
    into n distinguishable boxes, without exclusion, and allowing for empty boxes.

    http://www.elcamino.edu/faculty/gfry/210/DistributeBallsBoxes.pdf

    Since C(n, k) = n! / [k! (n - k)!], it follows that C(n + k - 1, k) = (n + k - 1)! / [k! (n - 1)!]

    We know there are 6 solutions on the 2 x 2 grid. This corresponds to (n, k) = (3, 2).
    Checking, we have C(3 + 2 - 1, 2) = C(4, 2) = 4! / [2! (4 - 2)!] = 4 * 3 * 2 / (2 * 2) = 6.
    So it works. Then the solution is:
    C(20 + 21 - 1, 20) = 40! / (20! * 20!) = product(21..40) / product(1..20)
    "
    (21..40).inject(:*) / (1..20).inject(:*)
  end
end
