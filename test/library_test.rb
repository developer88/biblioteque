$:.unshift File.dirname(__FILE__)
require 'test_helper'
include TestFileOperations

describe 'Engine' do
	describe 'work with library in a database' do
		let(:engine){setup_test_engine}
    before(:each) do
      @db = engine.load_db("test_path/testdb.ml")
      @db.create_library("TestLibrary")
    end

  	it "should create a new library in a loaded db" do
  		@db.id.must_equal("3423dfgs322dd")
      @db.libraries.size.must_equal 1
      @db.libraries.first.id.wont_be_nil
  	end

    it "should add files to a loaded library" do
      library = @db.libraries.first
      library.add("test_crawler_path/")
      library.files.size.must_equal 1
    end     

  	it "should delete created library from a loaded db" do
      status = @db.delete_library(@db.libraries.first.id)
  	  status.must_equal true
      @db.libraries.size.must_equal 0
  	end 
	end
end