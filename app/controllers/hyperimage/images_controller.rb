require 'RMagick'

module Hyperimage

  class ImagesController < Hyperimage::ApplicationController

    def show
      # Return HTTP 404 if no resource exists
      raise ActionController::RoutingError.new('Not Found') unless Hyperimage::Image.exist?(params[:resource])

      # If there's a GIF, select it (since it could have multiple frames);
      # otherwise, pick the first image.
      if Hyperimage::Image.exists?(params[:resource], 'gif')
        source = Hyperimage::Image.first(params[:resource], 'gif')
      else
        source = Hyperimage::Image.first(params[:resource])
      end

      source_file = Magick::Image::read(source)

      # If no frame is explicitly passed, default to the first (zeroth) frame
      frame = params[:frame].to_i

      # Return HTTP 404 if frame is out of range
      raise ActionController::RoutingError.new('Not Found') unless (0..(source_file.length - 1)).include?(frame)

      # Try to fetch the image
      @image = Hyperimage::Image.first(params[:resource], params[:format], frame)

      if @image.nil? # We need to generate the image
        if source_file.length > 1
          path = Hyperimage::Image.root.join(params[:resource])
          Dir.mkdir(path) unless File.exists?(path)
          @image = path.join([frame, params[:format]].join('.'))
        else
          @image = Hyperimage::Image.root.join([params[:resource], params[:format]].join('.'))
        end
        source_file[frame].write(@image) { self.quality = 100}
      end

      mime_type = Mime::Type.lookup_by_extension(File.extname(@image).sub('.', ''))
      send_file @image, :type => mime_type.to_s, :disposition => 'inline'
    end

  end

end
