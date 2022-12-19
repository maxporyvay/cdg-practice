def get_data
  pokemon_hash = {}
  print "Enter pokemon's name>"
  pokemon_hash[:name] = gets.chomp 
  print "Enter pokemon's color>"
  pokemon_hash[:color] = gets.chomp
  pokemon_hash
end

print "Enter pokemons number>"
num = gets.chomp.to_i
pokemon_list = []
num.times do
  pokemon_hash = get_data
  pokemon_list.append(pokemon_hash)
end

p pokemon_list
