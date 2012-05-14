Feature: Copy images to bsmart directory that aren't already there

  Its a pain going through Bsmart's product interface and manually adding
  product images.
  So in order to alleviate this pain
  I want to run a command to add the images for me

  Scenario: App just runs
    When I get help for "copy-images"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
    And the banner should document that this app's arguments are:
      | xml        | which is required | 
      | image_src  | which is required | 
      | image_dest | which is required | 

  Scenario: Run command with a catalog and a set of images
    Given an xml file named "catalog.xml" with the following products:
      | StockNum   | Reference |
      | 77-01-001  | ref1      |
      | 77-01-002  | ref2      |
      | 77-01-003  | ref3      |
    And the following images
      | ref1.jpg |
      | ref2.jpg |
    And a directory named "output"
    When I run `copy-images catalog.xml . output`
    Then the following files should exist:
      | output/77/01/77-01-001.jpg | 
      | output/77/01/77-01-002.jpg | 

  Scenario: Images in several subdirectories
    Given an xml file named "catalog.xml" with the following products:
      | StockNum   | Reference |
      | 77-01-001  | ref1      |
      | 77-01-002  | ref2      |
      | 77-01-003  | ref3      |
    And the following images
      | dir_one/ref1.jpg |
      | dir_two/ref2.jpg |
    And a directory named "output"
    When I run `copy-images catalog.xml . output`
    Then the following files should exist:
      | output/77/01/77-01-001.jpg | 
      | output/77/01/77-01-002.jpg | 
