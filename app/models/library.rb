require "./app/models/model.rb"
class Library < Model

	attr_accessor :updated_at, :db_id

	def self.create(name, db_id)
		raise "No" unless name
		lib = self.new
		lib.id = generate_id
		lib.name = name
		lib.db_id = db_id
		lib.created_at = Time.now
		lib.updated_at = Time.now
		lib
	end

	#==========	

	def initialize(params = {})
		super
		@items = []
		@to_hash_params = [:id, :name, :updated_at, :created_at, :db_id, :items]
	end	

	def items
		@items
	end

	def stat
		puts "#Library #{name} status#"
		puts " created at: #{created_at}"
		puts " updated at: #{updated_at}"
		puts " items: #{self.items.size}"
		puts " folders: #{folders.size}"
		puts " files: #{files.size}"
	end 

	def folders
		@items.select{|i| i[:file] == false}
	end

	def files
		@items.select{|i| i[:file] == true}
	end

	def add(path)   
		raise "No" unless path
		crawler = Crawler.new(path)
		@items = @items | crawler.search_for_library(id)
		true
	end

	def search(filter)
		return nil unless filter
		filter.downcase!
		items.select do |i|
			i[:path].downcase.index(filter) || 
			i[:name].downcase.index(filter) ||
			i[:id] == filter
		end
	end



end