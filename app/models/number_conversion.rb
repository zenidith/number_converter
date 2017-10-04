class NumberConversion < ApplicationRecord
  DIGITS = ('0'..'9').to_a + ('a'..'z').to_a
  def NumberConversion.number_to_base(number, base)
    return '0' if number == 0
    return 'indeterminate' if base < 2
    output = ''
    while number > 0
      bit = number % base
      letter = DIGITS[bit]
      output = letter + output
      number = number / base
    end
    output
  end

  validates :number, numericality: { greater_than_or_equal_to: 0 }
  validates :base, numericality: { greater_than: 1 }

  def output
    @output = NumberConversion.number_to_base(number, base) if @output.nil?
  end
end