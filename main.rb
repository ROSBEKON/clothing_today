if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/clothing"

puts "Сколько градусов за окном? (можно с минусом)"
puts

def clothing_paths
  Dir.glob("./data/*.txt")
end

# films = []
# directors = []

clothing_paths.each do |clothing_path|
  clothing_set = Clothing.new(clothing_path)
  puts clothing_set
  # films << film
  # directors << film.director
end

# new_directors = directors.uniq
#
# new_directors.each_with_index do |new_director, index|
#   puts "#{index + 1}: #{new_director}"
# end

# puts
# puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
# input_number = gets.to_i
#
# new_films = films.select{ |film| film.director == new_directors[input_number - 1] }
# puts
# puts "И сегодня вечером рекомендую посмотреть:"
# random = new_films.sample
# puts
# puts "#{random.director} - #{random.title} #{random.year}"


















