class String
  # recursive
  def to_arabic(str = self, result = 0)
    return result if str.empty?
    roman_mapping.values.each do |roman|
      if str.start_with?(roman)
        result += roman_mapping.invert[roman]
        str = str.slice(roman.length, str.length)
        return to_arabic(str, result)
      end
    end
  end

  # iterative
  def to_arabic
    result = 0
    str = self
    roman_mapping.values.each do |roman|
      while str.start_with?(roman)
        result += roman_mapping.invert[roman]
        str = str.slice(roman.length, str.length)
      end
    end
    result
  end

  # considering arabic numbers
  def another_to_arabic_number
    validate_roman
    convert_to_integer
  end

  #  convert celsius to farenhit
  def to_farenhit
    (self.to_f * 9 / 5 + 32).round(2)
  end

  #  convert farenhit to celsius
  def to_celsius
    ((self.to_f - 32 ) * 5 / 9 ).round(2)
  end

  private

  # arabic to integer conversion
  def convert_to_integer
    result = []
    roman_to_numbers.each_with_index do |num, index|
      if result.last && num > result.last
        result << num - result.pop
      else
        result.push(num)
      end
    end
    result.inject(&:+)
  end

  #  split the input and map it with all the roman numerals
  def roman_to_numbers
    split_roman.map { |letter| another_roman_mapping[letter] }
  end

  def split_roman
    self.split("")
  end

  #  validate if it is a roman numeral
  def validate_roman
    valid_letters = another_roman_mapping.keys
    raise "invalid Roman numeral" unless split_roman.all? { |letter| valid_letters.include?(letter) }
  end

  # mapping of roman numerals
  def another_roman_mapping
    {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
  end

  # mapping of roman numerals
  def roman_mapping
    {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  end
end
