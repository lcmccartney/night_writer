require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"

class NightReaderTest < Minitest::Test

  def test_it_converts_braille_to_text
    nr = NightReader.new
    input = "0.0.0.0.0.\n00.00000.0\n....0.0.0.\n"
    assert_equal ["0.0.0.0.0.00.00000.0....0.0.0."], nr.max_lines(input)

    nr = NightReader.new
    input = "..000.0.0....0.0...00.0...0..0.0.00.0...000.0..00....00.0..0..0.0..00000.0...00.\n..0..0..00..0.0...0000.0..0.0.00000..0...0.0..0000..0000..00..0.000..0000...00.0\n.0......0..0..0..00......00...0.0.0...00......0....00.....0..0..0...0...0..00.0.\n.00.0...0.0.0..0.00.0.0..0.00.00..\n00..0....00.0.0.00.000..000..0.000\n0...0..00...0...0...0...0...0.0..0\n"
    assert_equal ["..000.0.0....0.0...00.0...0..0.0.00.0...000.0..00....00.0..0..0.0..00000.0...00...0..0..00..0.0...0000.0..0.0.00000..0...0.0..0000..0000..00..0.000..0000...00.0.0......0..0..0..00......00...0.0.0...00......0....00.....0..0..0...0...0..00.0.", ".00.0...0.0.0..0.00.0.0..0.00.00..00..0....00.0.0.00.000..000..0.0000...0..00...0...0...0...0...0.0..0"], nr.max_lines(input)
  end

  def test_it_decodes_from_braille
    nr = NightReader.new
    input = "0.0.0.0.0.\n00.00000.0\n....0.0.0.\n"
    assert_equal "herro", nr.decode_from_braille(input)
  end

  def test_it_can_postprocess_capital_letter_placeholders
    nr = NightReader.new
    text = "hello `w`o`r`l`d"
    assert_equal "hello WORLD", nr.postprocess_input(text)
  end

end
