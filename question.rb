class Question
  attr_reader :number1, :number2, :operator, :correct_answer
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @operator = %w[+ - * /][rand(0..3)]
    @correct_answer = (number1).method(operator).(number2)
  end
end
