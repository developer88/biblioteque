require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'biblioteque'

module TestFileOperations
  def setup_test_engine(response_body_stub)
    File.stubs(:open).returns(true)
    File.stubs(:read).returns({id:"3423dfgs322dd",name:"testname",created_at:Time.now,updated_at:Time.now}.to_json)
    FileUtils.stubs(:cp).returns(true)
    File.stubs(:delete).returns(1)
    Biblioteque::Engine.new
  end
end