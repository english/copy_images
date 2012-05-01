Given /^the following images$/ do |images_table|
  touch_files(images_table.raw.flatten)
end

Given /^an xml file named "([^"]*)" with the following products:$/ do |filename, products_table|
  write_bsmart_catalog_xml filename, products_table.hashes
end
