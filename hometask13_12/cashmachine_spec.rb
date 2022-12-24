require 'rspec'
require_relative 'cashmachine'

RSpec.describe CashMachine do
  subject { described_class.new(balance) }

  let(:balance) { 100 }
  let(:amount) { 50 }
  let(:filepath) { "balance.txt" }

  describe '#make_deposit' do
    it 'make deposit > 0' do
      expect(subject.make_deposit(amount)).to eq("Your balance is now #{(balance + amount).round(2)}")
    end

    context 'when deposit amount is 0' do
      let(:amount) { 0 }

      it 'prints error message' do
        expect(subject.make_deposit(amount)).to eq("ERROR! Deposit amount must be greater than 0")
      end
    end
  end

  describe '#make_withdraw' do
    it 'make_withdraw > 0 and <= current balance' do
      expect(subject.make_withdraw(amount)).to eq("Your balance is now #{(balance - amount).round(2)}")
    end

    context 'when withdraw amount is 0' do
      let(:amount) { 0 }

      it 'prints error message' do
        expect(subject.make_withdraw(amount)).to eq("ERROR! Withdraw amount must be greater than 0 and less or equal than your balance")
      end
    end

    context 'when withdraw amount is > current balance' do
      let(:amount) { 101 }
  
      it 'prints error message' do
        expect(subject.make_withdraw(amount)).to eq("ERROR! Withdraw amount must be greater than 0 and less or equal than your balance")
      end
    end
  end

  describe '#check_balance' do
    it 'prints balance' do
        expect(subject.check_balance).to eq("Your balance is #{balance.round(2)}")
    end
  end

  describe '#save_balance' do
    before do
      @buffer = StringIO.new()
      allow(File).to receive(:open).with(filepath, 'w').and_yield( @buffer )
    end

    it 'saves balance to file' do
      subject.save_balance(filepath)
      expect(@buffer.string).to eq(balance.to_s)
    end
  end

  describe '#CashMachine.init' do
    let(:deposit_amount) { 25 }
    let(:withdraw_amount_1) { 126 }
    let(:withdraw_amount_2) { 23 }

    let(:prompt) do
      <<-EOS
Enter command>Your balance is #{ balance.round(2) }
Enter command>Enter deposit amount>Your balance is now #{ (balance + deposit_amount).to_f.round(2) }
Enter command>Enter withdraw amount>ERROR! Withdraw amount must be greater than 0 and less or equal than your balance
Enter command>Enter withdraw amount>Your balance is now #{ (balance + deposit_amount - withdraw_amount_2).to_f.round(2) }
Enter command>
      EOS
    end

    before do
      @buffer = StringIO.new()
      allow(File).to receive(:open).with(filepath, 'w').and_yield( @buffer )
      allow_any_instance_of(Kernel).to receive(:gets).and_return(
        'b', 'd', deposit_amount.to_s, 'w', withdraw_amount_1.to_s, 'w', withdraw_amount_2.to_s, 'q'
      )
    end

    it 'executes app' do
      expect { CashMachine.init(filepath, balance) }.to output(prompt.chomp).to_stdout
      expect(@buffer.string).to eq((balance + deposit_amount - withdraw_amount_2).to_f.round(2).to_s)
    end
  end
end
