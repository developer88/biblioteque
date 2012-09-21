$:.unshift File.dirname(__FILE__)
require 'test_helper'
include TestFileOperations

describe 'Engine' do
	describe 'do some actions on a database' do
      	let(:engine){setup_test_engine}
      	it "should clone a database" do
      		status = engine.create_db("TestDB", "test_path/testdb.ml")
      		status.must_equal true
                  status = engine.clone_db("test_path/testdb2.ml", "test_path/testdb.ml")
                  status.must_equal true
      	end
      	
      	it "should delete created db" do
      		db = engine.load_db("test_path/testdb.ml")
                  status = engine.delete_db
      		status.must_equal true
                  engine.current_db.must_be_nil
      	end

            it "should delete db by using db method" do
                  File.stubs(:delete).returns(1)
                  status = Biblioteque::Database.destroy("test_path/testdb.ml")
                  status.must_equal true
            end
	end
end