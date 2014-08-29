require 'aruba/api'
require 'aruba/reporting'

RSpec.configure do |config|
  config.include Aruba::Api
  config.after(:each) do
    restore_env
  end
end
