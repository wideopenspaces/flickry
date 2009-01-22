require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name     = "flickry"
    s.summary  = "Friendlier interface to flickr API, uses flickraw underneath"
    s.email    = "jake@wideopenspac.es"
    s.homepage = "http://github.com/wideopenspaces/flickry"
    s.description = "Interface to Flickr API to make working with API responses safer and easier. DO NOT USE ME YET!"
    s.authors  = ["Jacob Stetser"]
    s.add_dependency("wideopenspaces-flickraw",[">= 0.5.2"])
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'flickry'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rcov::RcovTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task :default => :rcov
