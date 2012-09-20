$:.unshift File.dirname(__FILE__)
require 'test_helper'
include TestFileOperations

describe 'Engine' do
	describe 'search for file' do
		let(:engine){setup_test_engine(true)}
    before(:each) do
      @db = engine.load_db("test_path/testdb.ml")
      @db.create_library("TestLibrary")
      @library = @db.libraries.first
      @library.add("test_crawler_path/")
    end

		it "should search entire database for '.txt' file" do
      results = @db.search('.txt')
      results.size.must_equal 1
      results[0][:library].must_equal @library.id
      results[0][:results].size.must_equal 1
      results[0][:results][0][:id].must_equal @library.files.first[:id]
    end

  	it "should search a library for 'path' file" do
  		results = @library.search('path')
      results.size.must_equal 1
      results[0][:id].must_equal @library.files.first[:id]
  	end     	
	end
end