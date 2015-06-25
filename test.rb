#!/usr/bin/env ruby

require File.join('test', 'unit')
require 'ruby_parser'

# Check whether ruby_parser functions correctly.
class TestRubyParser < Test::Unit::TestCase
    # Run a simple command taken from the ruby_parser README.
    def test_from_readme
        assert_equal(
            RubyParser.new.parse("1+1").to_s,
            's(:call, s(:lit, 1), :+, s(:lit, 1))'
        )
    end
end
