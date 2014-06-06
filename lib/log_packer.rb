require "log_packer/version"
require 'log_packer/packer'

module LogPacker
  # RAILS_ROOT/log/*.log
  #
  @@log_path = []
  
  mattr_accessor :log_path
  
  
end