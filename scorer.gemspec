$LOAD_PATH.unshift 'lib'
require 'scorer/version'

Gem::Specification.new do |s|
  s.name              = "scorer"
  s.version           = Scorer::Version
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Scorer is a string similarity scorer."
  s.homepage          = "http://github.com/mrduncan/scorer"
  s.email             = "matt@mattduncan.org"
  s.authors           = ["Matt Duncan"]

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("spec/**/*")
  s.files            += Dir.glob("test/**/*")

  s.description = <<description
    Scorer is a similarity scorer for strings.
description
end
