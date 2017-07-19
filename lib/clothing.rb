class Clothing
  def initialize(file_path)
    f = File.new(file_path, "r:UTF-8")
    content = f.readlines
    f.close
    @name_clothing= content[0].chomp
    @type_clothing = content[1].chomp
    @temperature = content[2].chomp
  end

  def name_clothing
    return @name_clothing
  end

  def type_clothing
    return @type_clothing
  end

  def temperature
    return  @temperature
  end
end
