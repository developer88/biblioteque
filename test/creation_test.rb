$:.unshift File.dirname(__FILE__)
require 'test_helper'
include TestFileOperations

describe 'Engine' do
	describe 'create an empty database' do
		let(:engine){setup_test_engine(true)}
		it "should create an empty databese" do
			status = engine.create_db("TestDB", "test_path/testdb.ml")
			status = true
      	end
	end
end