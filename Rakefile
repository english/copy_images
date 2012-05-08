#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress"
end

task :test => [:spec, :features]
task :default => :test
