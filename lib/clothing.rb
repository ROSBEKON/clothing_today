class Clothing
  def initialize(file_path, user_input)
    content = File.readlines(file_path, encoding: "UTF-8")
    if temp_value(content, user_input)
      @name_clothing= content[0].chomp
      @type_clothing = content[1].chomp
      @temperature = content[2].chomp
    end
  end

  def temp_value(content, user_input)
    sample = (content[2].chomp).delete('(+)').split(', ').map(&:to_i)
    if sample[1] >= user_input && sample[0] <= user_input
      true
    end
  end

  def name_clothing
    @name_clothing
  end

  def type_clothing
    @type_clothing
  end

  def temperature
    @temperature
  end
end