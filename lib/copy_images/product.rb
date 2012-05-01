require 'roxml'

module CopyImages
	class Product
    include ROXML

    attr_accessor :stock_number, :reference
    xml_accessor  :stock_number, from: 'StockNum'
    xml_accessor  :reference,    from: 'Reference'

    def initialize(attrs={})
      attrs.each { |k,v| send("#{k}=", v) }
    end

    def image_path
      department     = stock_number[0..1]
      sub_department = stock_number[3..4]

      File.join(department, sub_department, "#{stock_number}.jpg")
    end
  end
end
