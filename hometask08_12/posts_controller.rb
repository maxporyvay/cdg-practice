require_relative "resource"

class PostsController
    extend Resource
  
    def initialize
        @posts = []
    end
  
    def index
        str = ""
        @posts.each.with_index do |post, index|
            str += "#{index}. #{post}\n"
        end
        print str
    end
  
    def show
        print "Enter post id>"
        id = gets.chomp.to_i

        if id < 0 || id >= @posts.size
            puts "ERROR! There is no post with this id"
        else
            puts "#{id}. #{@posts[id]}"
        end
    end
  
    def create
        print "Enter post text>"
        newtext = gets.chomp

        id = @posts.size
        @posts << newtext
        puts "#{id}. #{newtext}"
    end
  
    def update
        print "Enter post id>"
        id = gets.chomp.to_i
        print "Enter post text>"
        newtext = gets.chomp

        if id < 0 || id >= @posts.size
            puts "ERROR! There is no post with this id"
        else
            @posts[id] = newtext
            puts "#{id}. #{newtext}"
        end
    end
  
    def destroy
        print "Enter post id>"
        id = gets.chomp.to_i

        if id < 0 || id >= @posts.size
            puts "ERROR! There is no post with this id"
        else
            @posts.delete_at(id)
        end
    end
end