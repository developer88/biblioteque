module Biblioteque
	class Engine

		def initialize
			@dbpath = nil
			@db = nil
		end

		def current_db
			@db
		end

		def current_db_path
			@dbpath
		end

		def load_db(path)
			@dbpath = path
			@db = Database.new(path:path)
			@db.load
			@db
		end

		def create_db(name, path)
			Database.create(name, path)
		end

		def clone_db(path_source, path_destination)
			Database.clone(path_source, path_destination)
		end

		def close_db
			@dbpath = nil
			@db = nil
		end

		def delete_db(path_source)
			close_db if path_source == current_db_path
			Database.destroy(path_source)
		end	

		def clone_current(path_destination)
			return false unless current_db_path
			Database.clone(current_db_path, path_destination)
		end		
	end
end