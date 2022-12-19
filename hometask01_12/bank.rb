require_relative "txtcrud"

DEFAULT_START_BALANCE = 100.0
balance_file = "balance.txt"
balance = -1
if File.exists?(balance_file)
  balance = find(balance_file, 0).to_f
else
  balance = DEFAULT_START_BALANCE
end

loop do
  print "Enter command>"
  command = gets.chomp.downcase
  case command
  when "d"
    print "Enter deposit amount>"
    deposit = gets.chomp.to_f
    if deposit <= 0
      puts "ERROR! Deposit amount must be greater than 0"
    else
      balance += deposit
      puts "Your balance is now #{balance.round(2)}"
    end
  when "w"
    print "Enter withdraw amount>"
    withdraw = gets.chomp.to_f
    if withdraw <= 0 || withdraw > balance
      puts "ERROR! Withdraw amount must be greater than 0 and less or equal than your balance"
    else
      balance -= withdraw
      puts "Your balance is now #{balance.round(2)}"
    end
  when "b"
    puts "Your balance is #{balance.round(2)}"
  when "q"
    File.write(balance_file, balance.round(2))
    break
  else
    puts "ERROR! Invalid command. Press d/w/b/q"
  end
end