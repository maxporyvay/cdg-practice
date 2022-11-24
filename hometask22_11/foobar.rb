require 'rspec'

def foobar(x, y)
	if x == 20
		return y
	elsif y == 20
		return x
	else
		return x + y
	end
end

RSpec.describe "foobar" do
	it "only first equals 20" do
		expect(foobar(20, 15)).to eq(15)		
	end

	it "only second equals 20" do
                expect(foobar(14, 20)).to eq(14)
        end

	it "both equal 20" do
                expect(foobar(20, 20)).to eq(20)
        end

	it "noone equals 20" do
                expect(foobar(3, 15)).to eq(18)
        end
end
