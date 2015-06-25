#!/usr/bin/env ruby
# Print the currently installed Cri version to stdout.
#
# This script exists soley for the convenience of the package maintainer.
require 'cri/version'

puts("Cri::VERSION is #{Cri::VERSION}")
