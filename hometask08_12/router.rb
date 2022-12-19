require_relative "posts_controller"

class Router
  def initialize
    @routes = {}
  end
  
  def init
    resources(PostsController, 'posts')
  
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
  
      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end
  
    puts 'Good bye!'
  end
  
  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end
  
router = Router.new
  
router.init