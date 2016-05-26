require "minitest/autorun"
require "minitest/pride"
require "./lib/file_writer"

class FileWriterTest < Minitest::Test

  def test_it_exists
    fw = FileWriter.new
    assert_instance_of FileWriter, fw
  end

end
