require 'rspec'

def say_something
	what = gets.chomp
	who = gets.chomp
	"#{what} #{who}"
end

RSpec.describe "Main" do
	it "#say_something" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return('Hello', 'John Snow')
		expect(say_something).to eq("Hello John Snow")
	end
end
