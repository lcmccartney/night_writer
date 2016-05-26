require_relative 'night_writer'
require_relative 'file_reader'
require_relative 'file_writer'

nw = NightWriter.new
plaintext = nw.reader.read
braille_string = nw.encode_to_braille(plaintext)
nw.writer.write(braille_string)
