
namespace :log_packer do
  
  desc "Archive Log by configuration LogPacker.log_path = [ Rails.root.join('log/*.log') ]"
  task :archive_log => :environment do
    
    puts "==========================================="
    puts " Logrotate starting at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    
    Array(LogPacker.log_path).each do |logfile|
      puts "Rotating: #{logfile}"
      LogPacker::Packer.rotate logfile
    end

    puts "==========================================="
    puts " Logrotate stopted at #{Time.now.strftime '%Y-%m-%d %H:%M:%S'}"
    puts "==========================================="
    puts ""
    
  end
end
