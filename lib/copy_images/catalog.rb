require 'roxml'
require 'copy_images/product'

module CopyImages
	class Catalog
		include ROXML

		xml_accessor :products, :in => 'supplier', :as => [Product]
	end
end
