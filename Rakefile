require 'rubygems'

require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task default: :spec

task :clobber_package do
  rm_r 'pkg' rescue nil
end
task clobber: [:clobber_package]
