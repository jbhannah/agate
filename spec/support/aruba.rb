require 'aruba/api'
require 'aruba/reporting'

RSpec.configure do |config|
  config.include Aruba::Api
  config.after(:each) do
    restore_env
  end
end

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
    set_env('JAVA_OPTS', "-d32 #{ENV['JAVA_OPTS']}") # force jRuby to use client JVM for faster startup times
  end
end if RUBY_PLATFORM == 'java'
