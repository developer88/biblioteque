require "./app/workers/engine.rb"
test_dir_path = "/Users/developer/Desktop/"
engine = Engine.new
puts "1. Create DB"
puts engine.create_db("TestDB", "#{test_dir_path}testdb.ml")
puts "2. Clone DB"
puts engine.clone_db("#{test_dir_path}testdb.ml", "#{test_dir_path}testdb2.ml")
puts "3. Load garbage DB"
db = engine.load_db("#{test_dir_path}testdb2.ml")
puts db.status
puts "4. Destroy DB"
puts engine.delete_db(engine.current_db_path)
puts "5. Current db is nil"
puts engine.current_db == nil
puts "6. Load working DB"
db = engine.load_db("#{test_dir_path}testdb.ml")
puts db.status
puts "7. Add Library"
puts db.create_library("TestLibrary").inspect
puts "8. Library count == #{db.libraries.size}"
puts "9. Save db"
puts db.save
puts "10. Select first library"
library = db.libraries.first
puts library.inspect
puts "11. Add files to library"
puts library.add("#{test_dir_path}test_crawler/")
puts "12. Show library stat"
puts library.stat
puts "13. Save db"
puts db.save
puts "14. Search for '1.torrent'"
puts library.search('1.torrent')
puts "15. Global search for 'torrent' throight libraries in db"
puts db.search('torrent')
puts "16. Search file by path name"
puts db.search('test')
