if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/clothing"

puts "Сколько градусов за окном? (можно с минусом)"
user_input = gets.to_i

def clothing_paths
  Dir.glob("./data/*.txt")
end
#  массив общий в него пишем все из класса Clothing
shared_arrays = []
#  массив только типов одежды в этот массив пишем только типы одежды из класса Clothing
type_arrays = []

clothing_paths.each do |clothing_path|
  clothing = Clothing.new(clothing_path)
  if clothing.if_under_the_temperature?(clothing.temperature, user_input)
    shared_arrays << clothing
    type_arrays << clothing.type_clothing
  end
end

new_type_arrays = type_arrays.uniq
puts "Предлагаем сегодня надеть:"
puts

new_type_arrays.each do |new_type_array|
  new_shared_arrays = shared_arrays.select{ |shared_array| shared_array.type_clothing == new_type_array }
  random = new_shared_arrays.sample
  puts "#{random.name_clothing} (#{random.type_clothing}) " \
       "#{(random.temperature).delete('(+ )').sub(',', '..')}"
end