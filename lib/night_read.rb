require_relative 'night_reader'
require_relative 'file_reader'
require_relative 'file_writer'

nr = NightReader.new
input = nr.reader.read
char_string = nr.decode_from_braille(input)
nr.writer.write(char_string)
