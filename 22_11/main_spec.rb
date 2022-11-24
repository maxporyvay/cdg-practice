require 'rspec'
require './main.rb'

RSpec.describe "Main methods" do
	it "multiplies numbers" do
		a = 6
		b = 8
		expect(multiply(6, 8)).to eq(48)
	end
end
