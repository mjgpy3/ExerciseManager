#!/usr/bin/env ruby

require 'test/unit'
require './data_parser'

class TestDataParser < Test::Unit::TestCase
  def test_parse_date_parses_a_standard_date_correctly
    answer = DataParser.date("05/05/13")
    expected = "Date 5 5 2013"

    assert_equal expected, answer
  end
end
