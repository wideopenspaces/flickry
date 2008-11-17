Gem::Specification.new do |s|
  s.name     = "flickry"
  s.version  = "0.1.1"
  s.date     = "2008-11-16"
  s.summary  = "Friendlier interface to flickr API, uses flickraw underneath"
  s.email    = "jake@wideopenspac.es"
  s.homepage = "http://github.com/wideopenspaces/flickry"
  s.description = "Interface to Flickr API to make working with API responses safer and easier. DO NOT USE ME YET!"
  s.has_rdoc = false
  s.authors  = ["Jacob Stetser"]
  s.files    = ["MIT-LICENSE",
    "README",
    "Rakefile",
    "flickry.gemspec",
    "init.rb",
    "install.rb",
    "lib/flickry",
    "lib/flickry/base.rb",
    "lib/flickry/location.rb",
    "lib/flickry/person.rb",
    "lib/flickry/photo.rb",
    "lib/flickry/size.rb",
    "lib/flickry/sizes.rb",
    "lib/flickry.rb",
    "lib/super_struct.rb",
    "rails/init.rb",
    "tasks/flickry_tasks.rake",
    "uninstall.rb"]
  s.test_files = ["test/flickry_test.rb",
    "test/test_helper.rb"]
  s.rdoc_options = []
  s.extra_rdoc_files = []
  s.add_dependency("flickraw", [" 0.4.5"])
end