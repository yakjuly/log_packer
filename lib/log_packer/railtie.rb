require 'log_packer'
require 'rails'

module LogPacker
  class Railtie < Rails::Railtie
    
    rake_tasks do
      load File.expand_path('../tasks.rb', __FILE__)
    end
    
  end
end
