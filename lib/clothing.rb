class Clothing

  attr_accessor :name_clothing, :type_clothing, :temperature

  def initialize(file_path)
    content = File.readlines(file_path, encoding: "UTF-8")
    @name_clothing= content[0].chomp
    @type_clothing = content[1].chomp
    @temperature = content[2].chomp.scan(/-?\d+/)
  end

  def if_under_the_temperature?(user_input)
    @temperature[1].to_i >= user_input && @temperature[0].to_i <= user_input
  end
end