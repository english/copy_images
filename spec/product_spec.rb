require_relative '../lib/copy_images/product'

module CopyImages
	describe Product do
		subject { Product.new(stock_number: '01-01-001', reference: 'ref') }

		its(:reference)    { should == 'ref'       }
		its(:stock_number) { should == '01-01-001' }

		describe "#image_path" do
			it "returns bsmart's path for this produtc's image" do
				subject.image_path.should == '01/01/01-01-001.jpg'
			end
		end
	end
end
