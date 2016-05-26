require "minitest/autorun"
require "minitest/pride"
require "./lib/night_writer"
require './lib/character_map'

class NightWriterTest < Minitest::Test

  def test_it_converts_text_to_braille
    nw = NightWriter.new
    text_line = "herro"
    assert_equal "0.0.0.0.0.\n00.00000.0\n....0.0.0.\n", nw.line_to_braille(text_line)
  end

  def test_it_can_process_capital_letter_placeholders
    nw = NightWriter.new
    text = "hello WORLD"
    assert_equal "hello `w`o`r`l`d", nw.preprocess_input(text)
  end

  def test_it_outputs_number_indicators
    skip
    nw = NightWriter.new
    input = "1234567890"
    assert_equal ["#a#b#c#d#e#f#g#h#i#j"], nw.max_line_break(input)
  end

  def test_it_creates_an_array_from_string
    nw = NightWriter.new
    input = "whatfrogstophomedudeseenposthelpdeadtime"
    assert_equal ["whatfrogstophomedudeseenposthelpdeadtime"], nw.max_line_break(input)
  end

  def test_it_creates_an_array_with_40_chars_per_string
    nw = NightWriter.new
    input = "Fear is the little-death that brings total obliteration."
    assert_equal ["`fear is the little-death that brings to", "tal obliteration."], nw.max_line_break(input)
  end

  def test_it_outputs_braille
    nw = NightWriter.new
    input = "Fear is the little-death that brings total obliteration."
    assert_equal "..000.0.0....0.0...00.0...0..0.0.00.0...000.0..00....00.0..0..0.0..00000.0...00.\n..0..0..00..0.0...0000.0..0.0.00000..0...0.0..0000..0000..00..0.000..0000...00.0\n.0......0..0..0..00......00...0.0.0...00......0....00.....0..0..0...0...0..00.0.\n.00.0...0.0.0..0.00.0.0..0.00.00..\n00..0....00.0.0.00.000..000..0.000\n0...0..00...0...0...0...0...0.0..0\n", nw.encode_to_braille(input)
  end

end
