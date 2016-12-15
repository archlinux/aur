#!/usr/bin/env ruby
# Taken from the readme. Run this script after updates as a sanity check.
require 'w3c_validators'

include W3CValidators

@validator = CSSValidator.new

results = @validator.validate_text('body { margin: 0px; }')

if results.errors.length > 0
  results.errors.each do |err|
    puts err.to_s
  end
else
  puts 'Valid!'
end
