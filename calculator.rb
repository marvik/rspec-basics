class Calculator

  VERSION = '0.1.0'
  BASE    = 2
  RESULT_FILE_NAME = 'result.txt'

  def self.version
    VERSION
  end

  def add(*args)
    @result = args.inject(:+)
  end

  def subtract(a, b)
    @result = a - b
  end

  def divide(a, b)
    @result = a / b
  end

  def binary(value)
    @result = value.to_s(BASE)
  end

  def export
    File.open(@result_file_name, 'w') { |f| f.write(@result) }
  end

  private

  def initialize(result_file_name = RESULT_FILE_NAME)
    @result_file_name = result_file_name
  end

end
