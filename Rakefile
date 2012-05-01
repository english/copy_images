#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'reek/rake/task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

Reek::Rake::Task.new do |t|
  t.source_files = FileList.new('lib/**/*.rb')
end

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress"
end

task :test => [:spec, :features]
task :default => :test
