require "log_packer/version"
require 'log_packer/packer'

require "log_packer/railtie" if defined?(Rails)

module LogPacker
  # RAILS_ROOT/log/*.log
  #
  @@log_filenames = []
  mattr_accessor :log_filenames
  
  
  @@log_dirs = []
  mattr_accessor :log_dirs
  
end