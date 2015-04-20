namespace :test do
  task :unit do
    begin
      require 'rspec/core/rake_task'

      task = RSpec::Core::RakeTask.new(:unit)
      task.rspec_opts = '--tag unit'
      task.run_task(false)
    rescue LoadError
      puts 'Failed to run unit tests, rspec not available'
    end
  end
end
