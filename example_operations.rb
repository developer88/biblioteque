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
