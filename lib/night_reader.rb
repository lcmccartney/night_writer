require_relative 'character_map'
require_relative 'file_reader'
require_relative 'file_writer'
require 'pry'

class NightReader
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def postprocess_input(plaintext)
    output_string = ""
    suppress_output = false
    plaintext.each_char.with_index do |letter, i|
      if letter == "`"
        output_string << plaintext[i+1].upcase
        suppress_output = true
      else
        if suppress_output
          suppress_output = false
        else
          output_string << letter
        end
      end
    end
    output_string
  end

  def max_lines(input)
    input = input.tr("\n","")
    input_array = input.scan(/.{1,240}/)
  end

  def decode_from_braille(input)
    line_array = max_lines(input)
    full_translated = ""
    line_array.each do |line|
      translated = braille_to_line(line)
      full_translated << translated
    end
     postprocess_input(full_translated)
  end

  def braille_to_line(line)
    braille_array = Array.new((line.length/3)/2){""}
    (line.length).times do |i|
      index_per_line = i % (line.length/3)
      if index_per_line % 2 == 0
        braille_array[index_per_line/2] << line[i] << line[i+1]
      end
    end
    translated = ""
    braille_array.each do |braille_char|
      translated << BRAILLE_CHARS[braille_char]
    end
    translated
  end

end
