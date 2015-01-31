require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run the cumcumber/aruba tests"
task :cucumber_aruba do
  sh %{bundle exec cucumber features/}
end
