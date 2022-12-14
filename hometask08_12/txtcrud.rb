# from previous hometask

def index(path)
    File.foreach(path) { |line| puts line }
end

def find(path, id)
    res = nil
    File.foreach(path).with_index do |line, index|
        if index == id
            res = line
            break
        end
    end
    unless res.nil?
        res.chomp
    else
        res
    end
end

def where(path, pattern)
    list = []
    File.foreach(path).with_index do |line, index|
        if line.include?(pattern)
            list.push(index)
        end
    end
    list
end

def update(path, id, text)
    buffer = 'buffer.txt'
    file = File.open(buffer, 'w')
    File.foreach(path).with_index do |line, index|
        file.puts(id == index ? text : line)
    end
    file.close
    File.write(path, File.read(buffer))
    File.delete(buffer) if File.exist?(buffer)
end

def delete(path, id)
    buffer = 'buffer.txt'
    file = File.open(buffer, 'w')
    File.foreach(path).with_index do |line, index|
        if index != id
            file.puts(line)
        end
    end
    file.close
    File.write(path, File.read(buffer))
    File.delete(buffer) if File.exist?(buffer)
end

def create(path, text)
    file = File.open(path, 'a')
    file.puts(text)
    file.close
end