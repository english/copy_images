require_relative '../lib/copy_images/image_copier'
require 'ostruct'

module CopyImages
	describe ImageCopier do
		describe '#find_image' do
      context "image filename exactly matching reference" do
				it "finds the image for a product" do
					subject.images = ['001-001-12.jpg', '001-002-03.jpg']
					reference = '001-001-12'

					subject.find_image(reference).should == '001-001-12.jpg'
				end
			end

      context "begining of image filename matches reference" do
        it "finds the image for a product" do
          subject.images = [ '001-001-12_blabla.jpg' ]
          reference = '001-001-12'

          subject.find_image(reference).should == '001-001-12_blabla.jpg'
        end
      end

      context "given lists of images in different subdirectories" do
        it "finds the image for a product" do
          subject.images = [
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE404.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE405.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE406.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE407.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EP286.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EP287.jpg" ]

          subject.find_image('EE404').should == '/Users/jamie/Dropbox/Ortak/Web/Firefly/EE404.jpg'
        end
      end

      context "image not available for reference" do
        it "returns false" do
          subject.images = [
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE404.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE405.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE406.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EE407.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EP286.jpg",
            "/Users/jamie/Dropbox/Ortak/Web/Firefly/EP287.jpg" ]

          subject.find_image('doesnt_exist').should be_false
        end
      end
		end

		describe "#make_way_for" do
			it "creates the necessary directories for a new file" do
				FileUtils.should_receive(:mkdir_p).with 'dest/01/01'

				subject.make_way_for 'dest/01/01/01-01-001.jpg'
			end
		end

		before(:each) do
			subject.images = [ '001-001-12.jpg' ]
			subject.dest_prefix = 'prefix'
			products = [
				OpenStruct.new(reference: '001-001-12', image_path: '77/01/77-01-001.jpg'),
				OpenStruct.new(reference: '002-001-12', image_path: '77/01/77-01-002.jpg')
			]
			subject.catalog = double('Catalog', products: products)
		end

		describe "#copy_images" do
			it "copies images" do
				FileUtils.should_receive(:copy).with('001-001-12.jpg', 'prefix/77/01/77-01-001.jpg')

				subject.copy_images
			end
		end
	end
end
