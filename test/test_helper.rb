require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'biblioteque'

module TestFileOperations
  def setup_test_engine(response_body_stub)
    #Stubs IO operations for testing purposes
    File.stubs(:open).returns(true)
    File.stubs(:read).returns({id:"3423dfgs322dd",name:"testname",created_at:Time.now,updated_at:Time.now}.to_json)
    File.stubs(:file?).returns(true)
    File.stubs(:delete).returns(1)
    File.stubs(:stat).returns(File::Stat.new("test"))
    FileUtils.stubs(:cp).returns(true)
    FileTest.stubs(:directory?).returns(false)
    Find.stubs(:find).yields("/test_crawler_path/test/path.txt")
    #
    Biblioteque::Engine.new
  end
end