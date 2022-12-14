require_relative "txtcrud"

DEFAULT_START_BALANCE = 100.0
BALANCE_FILE = "balance.txt"

class CashMachine
    def self.init(balance_file, default_start_balance)
        if File.exists?(balance_file)
            balance = find(balance_file, 0).to_f
        else
            balance = default_start_balance
        end

        cashMachine = CashMachine.new(balance)

        loop do
            print "Enter command>"
            command = gets.chomp.downcase
            case command
            when "d"
                print "Enter deposit amount>"
                deposit_amount = gets.chomp.to_f
                puts cashMachine.make_deposit(deposit_amount)
            when "w"
                print "Enter withdraw amount>"
                withdraw_amount = gets.chomp.to_f
                puts cashMachine.make_withdraw(withdraw_amount)
            when "b"
                puts cashMachine.check_balance
            when "q"
                cashMachine.save_balance(balance_file)
                break
            else
                puts "ERROR! Invalid command. Press d/w/b/q"
            end
        end
    end

    def initialize(balance)
        @balance = balance
    end

    def make_deposit(amount)
        if amount <= 0
            return "ERROR! Deposit amount must be greater than 0"
        else
            @balance += amount
            return "Your balance is now #{@balance.round(2)}"
        end
    end

    def make_withdraw(amount)
        if amount <= 0 || amount > @balance
            return "ERROR! Withdraw amount must be greater than 0 and less or equal than your balance"
        else
            @balance -= amount
            return "Your balance is now #{@balance.round(2)}"
        end
    end

    def check_balance
        return "Your balance is #{@balance.round(2)}"
    end

    def save_balance(balance_file)
        File.write(balance_file, @balance.round(2))
    end
end

CashMachine.init(BALANCE_FILE, DEFAULT_START_BALANCE) 