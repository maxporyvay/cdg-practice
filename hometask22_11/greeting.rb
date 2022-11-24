require 'rspec'

def greeting(firstname, lastname, age)
	greeting_start = "Привет, #{firstname} #{lastname}. "
	if age < 18
		greeting_end = "Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
	else
		greeting_end = "Самое время заняться делом!"
	end
	return greeting_start + greeting_end
end

RSpec.describe "greeting" do
	it "greeting age < 18" do
		expect(greeting("Максим", "Порывай", 21)).to eq("Привет, Максим Порывай. Самое время заняться делом!")		
	end

	it "greeting age >= 18" do
		expect(greeting("Максим", "Порывай", 17)).to eq("Привет, Максим Порывай. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
	end
end
