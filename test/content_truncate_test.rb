# encoding: utf-8
require 'test/unit'
require_relative '../lib/content_truncate'

class ContentTruncateTest < Test::Unit::TestCase
  
  def mock_string
    "Truncate a string down to \n x characters. <br/>Beware of truncating \n text that has HTML elements in it."
  end
  
  def test_content_truncate_for_no_separator
    assert_equal "Truncate a string...", mock_string.content_truncate(20)
  end
  
  def test_content_truncate_for_one_separator
    assert_equal "Truncate a string down to \n x characters. <br/>", mock_string.content_truncate(100, "<br/>")
  end
  
  def test_content_truncate_for_separators
    assert_equal "Truncate a string down to", mock_string.content_truncate(60, "\n", "<br/>", " ")
  end
  
  def test_content_truncate_for_missing_char
    assert_equal "Truncate a string down to \n x characters. <br/>", mock_string.content_truncate(60, "。", "<br/>")
  end
  
  def test_content_truncate_for_include_sep
    assert_equal "Truncate a string down to \n x characters. <br/>", mock_string.content_truncate(48, "。", "<br/>")
  end
  
  def test_content_truncate_for_nil_match
    assert_equal "测试中文无", "测试中文无符号".content_truncate(5, "。", "<br/>")
  end
end