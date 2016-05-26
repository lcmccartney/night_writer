class FileReader

  def read
    input = ARGV[0]
    File.read(input).chomp
  end

end
