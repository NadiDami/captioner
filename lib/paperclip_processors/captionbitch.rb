module Paperclip
  class Captionbitch < Processor
    def initialize file, options = {}, attachment = nil
      super
      @file           = file
      @attachment     = attachment
      @is_comic   = options[:comic]
      @current_format = File.extname(@file.path) 
      @format         = options[:format]
      @basename       = File.basename(@file.path, @current_format)
      @the_text       = options[:the_text]
      @mask_file      = options[:mask]

      # raise   options[:original_image].inspect
    end

    def make  
      temp_file = Tempfile.new([@basename, @format])
      temp_file.binmode
      # raise options.inspect
      if @is_comic

        run_string = "convert "
        run_string << "#{fromfile} "
        run_string << "-resize '400x400^' -gravity center -crop 300x400+0+0 +repage "
        run_string << "#{@mask_file} "
        run_string << "-composite  "
        run_string << "-gravity NorthWest -font 'Arial Narrow Bold Italic' -pointsize 18 -annotate +55+357 "
        run_string << "'#{@the_text}' " 
        run_string << "#{tofile(temp_file)}"

  
        Paperclip.run(run_string)
      end
  
      temp_file
    end

    def fromfile
      File.expand_path(@file.path)
    end

    def tofile(destination)

      File.expand_path(destination.path)
    end
  end
end