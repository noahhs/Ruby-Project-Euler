require 'minitest/autorun'
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file }

describe EulerProblem, "Testing Euler Problems" do
  def setup
    @problem = EulerProblem.new
  end

  def test_problem_one_answer
    assert_equal @problem.p1,  233168
  end

  def test_problem_two_answer
    assert_equal @problem.p2,  4613733
  end

  def test_problem_three_answer
    assert_equal @problem.p3,  6857
  end

  def test_problem_four_answer
    assert_equal @problem.p4,  906609
  end

  def test_problem_five_answer
    assert_equal @problem.p5, 9
  end

  def test_problem_six_answer
    assert_equal @problem.p6,  25164150
  end

  def test_problem_seven_answer
    assert_equal @problem.p7,  104729
  end

  def test_problem_eight_answer
    assert_equal @problem.p8,  40824
  end

  def test_problem_nine_answer
    assert_equal @problem.p9,  31875000
  end

  def test_problem_ten_answer
    assert_equal @problem.p10, 142913828922
  end

  def test_problem_eleven_answer
    assert_equal @problem.p11, 70600674
  end

  def test_problem_twelve_answer
    assert_equal @problem.p12, 76576500
  end

  def test_problem_thirteen_answer
    assert_equal @problem.p13, 5537376230
  end

  def test_problem_fourteen_answer
    assert_equal @problem.p14, 837799
  end

  def test_problem_fifteen_answer
    assert_equal @problem.p15, 137846528820
  end

  def test_problem_sixteen_answer
    assert_equal @problem.p16, 1366
  end

  def test_problem_seventeen_answer
    assert_equal @problem.p17, 21224
  end

  def test_problem_eighteen_answer
    assert_equal @problem.p18, 3195421975286299871723520000
  end

  def test_problem_nineteen_answer
    assert_equal @problem.p19, 0
  end
end
