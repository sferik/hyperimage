module Hyperimage

  class Image

    class << self

      def root
        @@root ||= Rails.root.join('app', 'assets', 'images')
      end

      def exist?(name, format=nil, frame=nil)
        !!self.first(name, format, frame)
      end
      alias :exists? :exist?

      def first(name, format=nil, frame=nil)
        self.all(name, format, frame).first
      end

      def all(name, format=nil, frame=nil)
        # Fetch all files matching the name
        images = self.files(name)
        if format
          # Filter out files that don't match the format
          images = images.select do |file|
            File.fnmatch("*.#{format}", file)
          end
          if frame
            # Filter out files that don't match the frame
            images = images.select do |file|
              File.fnmatch("#{self.root}/#{name}/#{frame}.#{format}", file)
            end
          end
        end
        return images
      end

    protected

      # Given name: 'foo'
      # Returns all files that match foo.* or foo/*
      def files(name)
        self.glob(name, '.') + self.glob(name, '/')
      end

      def glob(name, connector='.')
        Dir.glob(self.root.join([name, '*'].join(connector)))
      end

    end

  end

end
