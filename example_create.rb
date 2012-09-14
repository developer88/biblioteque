require "./app/workers/engine.rb"
test_dir_path = "/Users/developer/Desktop/"
engine = Engine.new
puts "1. Create DB"
puts engine.create_db("TestDB", "#{test_dir_path}testdb.ml")
puts "2. Load working DB"
db = engine.load_db("#{test_dir_path}testdb.ml")
puts db.status
puts "3. Add Library"
puts db.create_library("TestLibrary").inspect
puts "4. Library count == #{db.libraries.size}"
puts "5. Select first library"
library = db.libraries.first
puts library.inspect
puts "6. Add files to library"
puts library.add("#{test_dir_path}test_crawler/")
puts "7. Show library stat"
puts library.stat
puts "8. Save db"
puts db.save

