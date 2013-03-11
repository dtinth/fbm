Gem::Specification.new do |s|
  s.name              = "fbm"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Thai Pangsakulyanont"]
  s.email             = ["org.yi.dttvb@gmail.com"]
  s.homepage          = "https://github.com/dtinth/fbm"
  s.summary           = "Facebook Messenger CLI"
  s.description       = "Send Facebook messages from the command line"
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency "xmpp4r_facebook", ">= 0.1.1"
  s.add_runtime_dependency "commander", ">= 4.1.3"
  s.add_runtime_dependency "rest-graph", ">= 2.0.2"

  # The list of files to be contained in the gem 
  s.files         = `git ls-files`.split("\n")
  s.executables   = ["fbm"]

  s.require_path = 'lib'
end
