require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new
Rake::Task.define_task(:environment)

task default: :environment do
  if Dir['spec/dummy'].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir('../../')
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task test_app: :environment do
  ENV['LIB_NAME'] = 'spree_slider'
  Rake::Task['extension:test_app'].invoke
end
