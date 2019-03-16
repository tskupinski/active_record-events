$:.push File.expand_path('../lib', __FILE__)

require 'active_record/events/version'

Gem::Specification.new do |s|
  s.name        = 'active_record-events'
  s.version     = ActiveRecord::Events::VERSION
  s.author      = 'Bartosz Pieńkowski'
  s.email       = 'pienkowb@gmail.com'
  s.homepage    = 'https://github.com/pienkowb/active_record-events'
  s.summary     = 'Manage timestamps in ActiveRecord models'
  s.description = 'An ActiveRecord extension providing convenience methods for timestamp management.'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.test_files = Dir['spec/**/*']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'activerecord', '>= 3.0'
  s.add_dependency 'verbs', '~> 2.1'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'standalone_migrations'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'timecop'
end
