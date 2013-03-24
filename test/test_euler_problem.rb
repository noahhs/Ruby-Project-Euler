require 'minitest/autorun'
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file }

describe EulerProblem, "Testing Euler Problems" do
  def setup
    @problem = EulerProblem.new
  end

  def test_problem_one_answer
    assert_equal 233168, @problem.p1
  end
end
