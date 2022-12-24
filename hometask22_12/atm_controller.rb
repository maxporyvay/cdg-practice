def find(path, id)
  res = nil
  File.foreach(path).with_index do |line, index|
    if index == id
      res = line
      break
    end
  end
  if !res.nil?
    res.chomp
  else
    res
  end
end

class AtmController
  def self.init(balance_file)
    default_start_balance = 100.0

    balance = find(balance_file, 0).to_f ? File.exist?(balance_file) : default_start_balance

    AtmController.new(balance, balance_file)
  end

  def initialize(balance, balance_file)
    @balance_file = balance_file
    @balance = balance
  end

  def make_deposit(amount)
    if amount <= 0
      'ERROR! Deposit amount must be greater than 0'
    else
      @balance += amount
      "Your balance is now #{@balance.round(2)}"
    end
  end

  def make_withdraw(amount)
    if amount <= 0 || amount > @balance
      'ERROR! Withdraw amount must be greater than 0 and less or equal than your balance'
    else
      @balance -= amount
      "Your balance is now #{@balance.round(2)}"
    end
  end

  def check_balance
    "Your balance is #{@balance.round(2)}"
  end

  def save_balance
    File.open(@balance_file, 'w') { |f| f.write(@balance.round(2)) }
  end
end
