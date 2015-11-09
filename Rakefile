require "rspec/core/rake_task"
require "./lib/roguelike"

task :console do
  exec "irb -r ascii_art -I ./lib"
end

task :run do
  Roguelike.run("dev_map.yaml")
end
