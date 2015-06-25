#!/usr/bin/env ruby

require File.join('test', 'unit')
require 'ruby2ruby'
require 'ruby_parser'

# Check whether ruby_parser functions correctly.
class TestRuby2Ruby < Test::Unit::TestCase
    # Run a set of commands adapted from the readme.
    def test_from_readme
        sexp = RubyParser.new.process("def func\n  puts 42\nend")
        assert_equal(Ruby2Ruby.new.process(sexp), "def func\n  puts(42)\nend")
    end
end
