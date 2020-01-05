# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test_unit) do |t|
  t.test_files = Dir['test/**/*_spec.rb'] + Dir['test/**/test_*.rb']
  t.libs << 'test'
end
