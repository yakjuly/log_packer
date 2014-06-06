Auto pack rails log

#requirement
  Install bzip2
  
  
# How to use
  ```config/initializers/log_packer.rb
  
  LogPacker.log_path = [
    Rails.root.join("log/*.log").to_s
  ]
  
   rake log_packer:archive_log
  ```
  
#with Whenever
  every :day, at: "1:00 am" do
    rake "log_packer:archive_log"
  end