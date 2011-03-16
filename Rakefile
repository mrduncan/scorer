require 'rake'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

task :benchmark do
  require File.expand_path(File.join(File.dirname(__FILE__), "/test/benchmark"))
end
