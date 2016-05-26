require_relative 'character_map'
require_relative 'file_reader'
require_relative 'file_writer'
require "pry"

class NightWriter
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def encode_file_to_braille
    plain = reader.read
    braille = encode_to_braille(plain)
  end

  def preprocess_input(plaintext)
    output_string = ""
    plaintext.each_char do |letter|
      if letter != letter.downcase
        output_string << '`' + letter.downcase
      else
        output_string << letter
      end
    end
    output_string
  end

  def max_line_break(input)
    processed = preprocess_input(input)
    processed.scan(/.{1,40}/)
  end

  def encode_to_braille(input)
    line_array = max_line_break(input)
    string = ""
    line_array.each do |line|
      string << line_to_braille(line)
    end
    string
  end

  def line_to_braille(text_line)
    braille_line = ""
    3.times do |i|
      braille_segment = ""
      text_line.each_char do |letter|
        braille_segment << CHARACTERS[letter][i]
      end
      braille_segment << "\n"
      braille_line << braille_segment
    end
    braille_line
  end

end
