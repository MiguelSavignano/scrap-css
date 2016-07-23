require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'scrap-css'
  s.version     = ScrapCss::VERSION
  s.executables << 'scrapcss'
  s.date        = '2016-07-20'
  s.summary     = "ScrapCss"
  s.description = "Get only the css used in a html portion; use to understand a web components from other web site."
  s.authors     = ["Miguel Savignano"]
  s.email       = 'migue.masx@gmail.com'
  s.files       = ["lib/scrap_css.rb"]
  s.homepage    =
    'http://rubygems.org/gems/scrap-css'
  s.license       = 'MIT'
end
