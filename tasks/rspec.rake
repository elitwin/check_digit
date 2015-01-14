require 'rspec/core/rake_task'

desc "Run RSpec code examples in progress mode"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end