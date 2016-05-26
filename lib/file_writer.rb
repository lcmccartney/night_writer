class FileWriter

  def write(output)
    writer = File.open(ARGV[1], "w")
    writer.write(output)
    puts "Created '#{ARGV[1]}' containing #{output.length} characters."
  end

end
