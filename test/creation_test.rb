$:.unshift File.dirname(__FILE__)
require 'test_helper'
include TestFileOperations

describe 'Engine' do
	describe 'create an empty database' do
		let(:engine){setup_test_engine(true)}
		it "should create an empty database" do
			status = engine.create_db("TestDB", "test_path/testdb.ml")
			status.must_equal true
    end

  	it "should load created db" do
  		db = engine.load_db("test_path/testdb.ml")
  		db.id.must_equal("3423dfgs322dd")
  		db.name.must_equal("testname")
  		db.status.must_equal("Loaded")
  	end

  	it "should save created db" do
  		db = engine.load_db("test_path/testdb.ml")
  		db.save.must_equal true 
  	end

    it "should close loaded db" do
  		db = engine.load_db("test_path/testdb.ml")
  		db.wont_be_nil
  		engine.current_db.wont_be_nil
  		engine.close_db
  		engine.current_db.must_be_nil
    end      	
	end
end