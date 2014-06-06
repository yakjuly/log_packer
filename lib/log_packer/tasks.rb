namespace :log_packer do
  
  desc "Archive Log by configuration LogPacker.log_path = [ Rails.root.join('log/*.log') ]"
  task :archive_log => :environment do
    
    puts "==========================================="
    puts " Logrotate starting at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    
    log_filenames = LogPacker.log_filenames.map(&:to_s)
    log_dirs = LogPacker.log_dirs
    
    
    total_filenames = (Dir[*log_dirs] + log_filenames).uniq
    parent_dir_names = total_filenames.map{|filename| File.basename(filename) }.uniq
    
    #clear /last
    parent_dir_names.each do |dirname|
      PackLoger.last_dir(dirname)
      system "cd #{dirname} && rm -f *.bz2"
    end
    
    total_filenames.each do |logfile|
      puts "Rotating: #{logfile}"
      LogPacker::Packer.rotate logfile
    end
    
    puts "==========================================="
    puts " Logrotate stopted at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    puts ""
    
  end
end
