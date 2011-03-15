Gem::Specification.new do |s|
  s.name = %q{fax_finder}
  s.version = "0.0.1"
  s.date = %q{2011-03-15}
  s.authors = ["Erich L. Timkar"]
  s.email = %q{erich@hordesoftware.com}
  s.summary = %q{Provides support MultiTech's FaxFinder server}
  s.homepage = %q{http://github.com/erichhorde/fax_finder}
  s.description = %q{Provides base access for sending faxes and querying MultiTech's FaxFinder server.}
  s.files = [ "README", 
              "Changelog", 
              "LICENSE", 
              "lib/fax_finder.rb",
              'lib/fax_finder/server.rb']
  s.test_files = [
      "test/server_test.rb",
       "test/test_helper.rb"
  ]              
  s.required_ruby_version = '>= 1.8.7'
end