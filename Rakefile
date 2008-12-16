require 'rake'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = false 
end

PKG_NAME = "playbills"
PKG_VERSION   = "0.1"
PKG_TAG = "playbills-0_1"
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

spec = Gem::Specification.new do |s|
  s.name = PKG_NAME
  s.version = PKG_VERSION
  s.files = FileList['lib/**/*', 'spec/**/*', 'rails/**/*', 'generators/**/*', '*'].to_a
  s.require_path = 'lib'
  s.test_files = Dir.glob('spec/*_spec.rb')
  s.bindir = 'bin'
  s.executables = []
  s.summary = "Playbills Rails Plugin - Publish Limelight Productions"
  s.description = "Playbills Rails Plugin - Publish Limelight Productions"
  s.author = "8th Light, Inc."
  s.email = "micah@8thlight.com"
  
  s.add_dependency('resource_controller', ">= 0.5.3")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end

desc "clean out previous builds"
task :clean do
  system "rm -rf pkg"
end

desc "install in example"
task :install => [:clean, :gem] do
  system "git commit -a -m 'installing'"
  system "sudo gem uninstall playbills"
  system "sudo gem install pkg/#{PKG_FILE_NAME}"
  system "rm -rf example"
  system "git checkout example"
  system "cd example && rake gems:unpack playbills"
end