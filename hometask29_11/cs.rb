word = gets.chomp
if word.length > 1
    ending = word[-2..].downcase
    if ending == "cs"
        puts 2 ** word.length
    else
        puts word.reverse
    end
else
    puts word.reverse
end