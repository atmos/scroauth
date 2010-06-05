require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'bundler'

task :default => [:spec]

require 'spec/rake/spectask'
desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
  t.spec_opts << '--loadby' << 'random'

  t.rcov_opts << '--exclude' << 'spec,.bundle,.rvm'
  t.rcov = ENV.has_key?('NO_RCOV') ? ENV['NO_RCOV'] != 'true' : true
  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
end

GEM = "scroauth"
GEM_VERSION = "0.0.3"
AUTHOR = "Corey Donohoe"
EMAIL = "atmos@atmos.org"
HOMEPAGE = "http://github.com/atmos/scroauth"
SUMMARY = "Authenticated scros"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  bundle = Bundler::Definition.from_gemfile('Gemfile')
  bundle.dependencies.each do |dep|
    next unless dep.groups.include?(:runtime)
    s.add_dependency(dep.name, dep.version_requirements.to_s)
  end

  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("{lib}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
