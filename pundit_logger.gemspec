
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pundit_logger/version"

Gem::Specification.new do |spec|
  spec.name          = 'pundit_logger'
  spec.version       = PunditLogger::VERSION
  spec.authors       = ['Steve Hodges']
  spec.email         = ['shodges317@gmail.com']

  spec.summary       = %q{Log policy usage in Rails apps which use Pundit}
  spec.description   = 'Pundit is a lightweight authorization gem. But, in ' \
                       'complex Rails apps, it can be difficult to determine ' \
                       'why authorization failed, or which policies are ' \
                       'involved in a request. pundit_logger adds logging ' \
                       'during many Pundit events to your Rails application logs.'
  spec.homepage      = 'https://github.com/stevehodges/pundit_logger'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.add_dependency "pundit", "~> 1.0"
  spec.add_dependency "rails", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 3.0"
  spec.add_development_dependency "rails", "~> 5.0"
  spec.add_development_dependency "sqlite3", '~> 1.3', '< 1.4'
  spec.add_development_dependency "pry"
end
