require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'biblioteque'

module TestFileOperations
  def setup_test_engine(response_body_stub)
    File.stubs(:open).returns(true)
    Biblioteque::Engine.new
  end
end