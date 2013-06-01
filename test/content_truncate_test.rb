# encoding: utf-8
require 'test/unit'
require_relative '../lib/content_truncate'

class ContentTruncateTest < Test::Unit::TestCase
  include ContentTruncate::String
  
  def mock_string
    "Truncate a string down to \n x characters. <br/>Beware of truncating \n text that has HTML elements in it."
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
  
  def test_content_truncate_default_behaviour
    assert_equal "Truncate a string down to \n x characters. <br/>", mock_string.content_truncate(48)
  end
  
  def test_example
    assert_equal "The Model layer represents your domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic that is specific to your application.", "The Model layer represents your domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic that is specific to your application. In Rails, database-backed model classes are derived from ActiveRecord::Base. Active Record allows you to present the data from database rows as objects and embellish these data objects with business logic methods. Although most Rails models are backed by a database, models can also be ordinary Ruby classes, or Ruby classes that implement a set of interfaces as provided by the Active Model module. You can read more about Active Record in its README.".content_truncate(180)
  end
end