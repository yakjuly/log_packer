require "fileutils"

module LogPacker
  class Packer

    class << self
      # Functions
      def truncate(file)
        `echo '' > #{file}`
      end

      def archive_path(logfile)
        archived_dir = File.dirname(logfile) + '/archived'
        last_dir = File.dirname(logfile) + '/last'
        FileUtils.mkdir(archived_dir) unless File.directory?(archived_dir)
        FileUtils.mkdir(last_dir) unless File.directory?(last_dir)
        archived_dir + '/' + File.basename(logfile) + '.' + Time.now.strftime('%Y%m%d%H%M%S')
      end

      def last_dir(logfile)
        log_path = File.directory?(logfile) ? logfile : File.dirname(logfile)
        last_dir = log_path + '/last/'
        FileUtils.mkdir(last_dir) unless File.directory?(last_dir)
        last_dir
      end

      def rotate(logfile)
        if !File.exists?(logfile)
          puts "#{logfile} does not exist"
        elsif File.size(logfile) == 0
          puts "#{logfile} is empty"
        else
          archive_file = archive_path(logfile)
          last_dir = last_dir(logfile)
          puts "Copying #{logfile} to #{archive_file}.bz2"
          FileUtil.cp logfile, "#{archive_file}"
          truncate logfile
          system "bzip2 #{archive_file}"
          system "cd #{last_dir} && ln -sf #{archive_file}.bz2 ."
        end
      end
    end
  end
end