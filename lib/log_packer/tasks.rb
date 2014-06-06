namespace :log_packer do
  
  desc "Archive Log by configuration LogPacker.log_path = [ Rails.root.join('log/*.log') ]"
  task :archive_log => :environment do
    
    puts "==========================================="
    puts " Logrotate starting at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    
    log_filenames = Array(LogPacker.log_filenames).map(&:to_s)
    log_dirs = Array(LogPacker.log_dirs)
    
    log_dirs.each do |logdir|
      puts "Rotating: #{logdir}"
      Dir.glob(logdir).each do |filename|
        next if log_filenames.include?(filename)
        LogPacker::Packer.rotate filename
      end
    end
    
    log_filenames.each do |logfile|
      puts "Rotating: #{logfile}"
      LogPacker::Packer.rotate logfile
    end

    puts "==========================================="
    puts " Logrotate stopted at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    puts ""
    
  end
end
