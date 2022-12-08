require_relative 'txtcrud'

studfile = 'students.txt'
outfile = 'results.txt'
out = File.open(outfile, 'w')
out.close
students = []
File.foreach(studfile) { |student| students.push(student) }

loop do
    print 'Enter age>'
    query = gets.chomp
    if query == '-1'
        index(outfile)
        break
    else
        indices = where(studfile, query)
        indices.each { |idx| create(outfile, students[idx]) if where(outfile, students[idx]).empty? }
    end
    unless find(outfile, students.size - 1).nil?
        index(outfile)
        break
    end
end