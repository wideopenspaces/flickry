# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{flickry}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Stetser"]
  s.date = %q{2009-01-22}
  s.description = %q{Interface to Flickr API to make working with API responses safer and easier. DO NOT USE ME YET!}
  s.email = %q{jake@wideopenspac.es}
  s.files = ["README.markdown", "VERSION.yml", "lib/flickry", "lib/flickry/base.rb", "lib/flickry/comment.rb", "lib/flickry/license.rb", "lib/flickry/location.rb", "lib/flickry/person.rb", "lib/flickry/photo.rb", "lib/flickry/place.rb", "lib/flickry/size.rb", "lib/flickry/sizes.rb", "lib/flickry/tag.rb", "lib/flickry.rb", "lib/super_struct.rb", "test/flickry_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/wideopenspaces/flickry}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Friendlier interface to flickr API, uses flickraw underneath}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wideopenspaces-flickraw>, [">= 0.5.2"])
    else
      s.add_dependency(%q<wideopenspaces-flickraw>, [">= 0.5.2"])
    end
  else
    s.add_dependency(%q<wideopenspaces-flickraw>, [">= 0.5.2"])
  end
end
