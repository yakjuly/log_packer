#requirement
  Install bzip2
  
  
# How to use
  ```
  #config/initializers/log_packer.rb
  
  LogPacker.log_dirs = [
    Rails.root.join("log").to_s
  ]
  
  LogPacker.log_filenames = [
    Rails.root.join("log/production.log"),
    Rails.root.join("log/restclient.log")
  ]
  
  rake log_packer:archive_log
  ```
  
#with Whenever
  ```
  every :day, at: "1:00 am" do
    rake "log_packer:archive_log"
  end
  ```