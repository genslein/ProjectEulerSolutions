require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'

task :default=>[:spec]

desc "Run all spec tests"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = ['spec/*_spec.rb']
  t.rspec_opts = "-fd -c"
end

desc "Run all spec tests and generate a coverage report"
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['spec'].invoke
  `open coverage/index.html` if RUBY_PLATFORM.downcase.include?("darwin")
end
