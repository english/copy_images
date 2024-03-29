require 'fileutils'

module CopyImages
	class ImageCopier
		attr_accessor :catalog, :images, :dest_prefix

		def initialize(attrs={})
			attrs.each { |k,v| send("#{k}=", v) }
		end

		def copy_images
			@catalog.products.each do |product|
				copy_image(product)
			end

      self
		end

		def copy_image(product)
			src = find_image(product.reference)
      return unless src

			dest = File.join(@dest_prefix, product.image_path)
			make_way_for(dest)
			FileUtils.copy(src, dest)

      self
		end

		def find_image(reference)
			images.find { |image| File.basename(image) =~ /^#{reference}/i }
		end

		def make_way_for(filename)
			dir = File.dirname(filename)
			FileUtils.mkdir_p(dir)

      self
		end
	end
end
