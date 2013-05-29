require 'test/unit'
require_relative '../lib/content_truncate'

class ContentTruncateTest < Test::Unit::TestCase
  
  def mock_string
    "Truncate a string down to \n x characters. <br/> Beware of truncating \n text that has HTML elements in it."
  end
  
  def test_content_truncate_for_no_separator
    assert_equal "Truncate a string...", mock_string.content_truncate(20)
  end
  
  def test_content_truncate_for_one_separator
    assert_equal "Truncate a string down to \n x characters.", mock_string.content_truncate(100, "<br/>")
  end
  
  def test_content_truncate_for_separators
    assert_equal "Truncate a string down to", mock_string.content_truncate(60, "\n", "<br/>", " ")
  end
end