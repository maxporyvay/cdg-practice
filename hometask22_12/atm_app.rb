require 'rack'
require './atm_controller'

class AtmApp
  def initialize
    @atm_controller = AtmController.init('./balance.txt')
  end

  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    case req.path
    when '/'
      result = [200, { 'Content-Type' => 'text/html' }, File.readlines('./index.html')]
    when '/deposit'
      answer = @atm_controller.make_deposit(params['value'].to_f)
      result = [200, { 'Content-Type' => 'text/html' }, ["<h1>#{answer}</h1>", "<a href='/'>Home</a>"]]
    when '/withdraw'
      answer = @atm_controller.make_withdraw(params['value'].to_f)
      result = [200, { 'Content-Type' => 'text/html' }, ["<h1>#{answer}</h1>", "<a href='/'>Home</a>"]]
    when '/balance'
      answer = @atm_controller.check_balance
      result = [200, { 'Content-Type' => 'text/html' }, ["<h1>#{answer}</h1>", "<a href='/'>Home</a>"]]
    else
      result = [404, { 'Content-Type' => 'text/html' }, ['<h1>Error 404<h1>', '<h1>Page is not found<h1>']]
    end

    @atm_controller.save_balance
    result
  end
end
