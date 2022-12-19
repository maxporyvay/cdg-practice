def foobar(x, y)
  if x == 20
    return y
  elsif y == 20
    return x
  else
    return x + y
  end
end

def greeting(firstname, lastname, age)
  greeting_start = "Привет, #{firstname} #{lastname}. "
  if age < 18
    greeting_end = "Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    greeting_end = "Самое время заняться делом!"
  end
  return greeting_start + greeting_end
end