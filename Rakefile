require "rspec/core/rake_task"
require "./lib/roguelike"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  exec "irb -r ascii_art -I ./lib"
end

task :run do
  Roguelike.run("./map.yaml")
end
