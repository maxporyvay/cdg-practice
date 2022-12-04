def getdata()
    pokemonhash = {}
    print "Enter pokemon's name>"
    pokemonhash[:name] = gets.chomp 
    print "Enter pokemon's color>"
    pokemonhash[:color] = gets.chomp
    pokemonhash
end

num = gets.chomp.to_i
pokemonlist = []
num.times do
    pokemonhash = getdata
    pokemonlist.append(pokemonhash)
end

p pokemonlist