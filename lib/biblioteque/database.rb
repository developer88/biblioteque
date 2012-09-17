module Biblioteque
	class Database < Model
		attr_accessor :path, :updated_at

		def self.create(name, path)
			raise "No" unless name || path
			new_db = {id:generate_id,name:name,created_at:Time.now,updated_at:Time.now}
			File.open(path,"w+") do |f|
			  f.write(new_db.to_json)
			end
			true
		end

		def self.clone(path_source, path_destination)
			raise "No" unless path_source || path_destination
			FileUtils.cp(path_source, path_destination)
			true
		end

		def self.destroy(path_source)
			File.delete(path_source) ? true : false
		end

		def initialize(params = {})
			super
			@libraries = []
			@dbpath = params[:path]
			@loaded = false
			@library = nil
			@to_hash_params = [:id, :name, :updated_at, :created_at]
		end

		def create_library(name)
			raise "No" unless name
			lib = Library.create(name, self.id)
			@libraries << lib
			lib
		end

		def load_library(library_id)
			@libraries.each do |lib|
				if lib.id == library_id
					@library = lib
					return lib
				end
			end	
			nil
		end

		def close_library
			@library = nil
		end

		def current_library
			@library
		end

		def libraries
			@libraries
		end

		def load
			json = File.read(@dbpath)
			db = JSON.parse(json)
			self.id = db["id"]
			self.name = db["name"]
			self.path = @dbpath
			self.created_at = db["created_at"]
			self.updated_at = db["updated_at"]
			load_libraries(db["libraries"])
			@loaded = true
		end	

		def status
			@loaded ? "Loaded" : "Not Loaded"
		end	

		def save
			db = self.to_hash
			db[:libraries] = []
			libraries.each{|l| db[:libraries] << l.to_hash }
			save_to_file(@dbpath ,db.to_json)
		end

		def search(filter)
			results = []
			libraries.each do |l|
				results << {library:l.id,results:l.search(filter)}
			end
			results
		end

		private 

		def load_libraries(libraries_arr)
			return false unless libraries_arr
			libraries_arr.each do |library|
				lib = Library.new(id:library[:id],name:library[:id],
					db_id:library[:db_id],created_at:library[:created_at],
					updated_at:library[:updated_at])
				lib.items = library[:items]
				@libraries << lib
			end
			true
		end	
	end
end