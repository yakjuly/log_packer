require "log_packer/version"
require 'log_packer/packer'

require "log_packer/railtie" if defined?(Rails)

module LogPacker
  # RAILS_ROOT/log/*.log
  #
  @@log_path = []
  
  mattr_accessor :log_path
  
  
end