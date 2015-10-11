#!/usr/bin/env ruby

require 'lumberjack'

NUM = rand(1 .. 1000)

# Adapted from the README file.
puts "Printing #{NUM} to null device with Lumberjack."
logger = Lumberjack::Logger.new(Lumberjack::Device::Null.new)
logger.info(NUM.to_s)
