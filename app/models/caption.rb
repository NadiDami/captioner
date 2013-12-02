class Caption < ActiveRecord::Base
  has_attached_file :captioned_photo,
                  processors: [:captionbitch],
                  styles: -> (attachment) {
                      {
                      comic: {
                        format: '.png',
                        comic: true,
                        the_text: attachment.instance.text,
                        original_image: attachment.uploaded_file,
                        mask: Rails.root.join('public/mask.png')
                      }
                    }
                  } 

  belongs_to :submission
end

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
      @geometry       = Paperclip::Geometry.from_file(@file)

    end

    def make  
      temp_file = Tempfile.new([@basename, @format])
      temp_file.binmode
      

      # this is a bi rubbish we should really escape the string properly.

      @the_text.gsub!("'", "")

      if @geometry.width > @geometry.height
        resize_string = "-resize '400x400^' "
      else
        resize_string = "-resize '400x400' "
      end    

      if @is_comic
        run_string = "convert "
        run_string << "#{fromfile} "
        run_string << "#{resize_string} "
        run_string << "-gravity center -crop 300x400+0+0 +repage "
        run_string << "#{@mask_file} "
        run_string << "-composite  "
        run_string << "-gravity NorthWest -font 'Arial Narrow Bold Italic' -pointsize 14 -annotate +55+351 "
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



