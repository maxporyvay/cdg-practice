require 'rspec'

def say_something(what, who)
	"#{what} #{who}"
end

RSpec.describe "Main" do
	it "#say_something" do
		expect(say_something("Hello", "John Snow")).to eq("Hello John Snow")
	end
	it "#say_something failure example" do
		expect(say_something("a", "b")).to eq("b a")
	end	
end

