# encoding: utf-8

require "bundler/gem_tasks"

require "rake/testtask"

# load path
$: << File.expand_path("../lib", __FILE__)

# default task
task :default do
  sh "rake -T"
end

# test tasks
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"]
end

namespace :test do
    Rake::TestTask.new(:units) do |t|
    t.libs << "test"
    t.test_files = FileList["test/units/**/test_*.rb"]
  end
end
