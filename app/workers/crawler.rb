require 'pathname'
require 'find'
require 'fileutils'
class Crawler

	def initialize(path)
		raise "No" unless path
		@path = path
	end

	def search_for_library(library_id)
		arr = []
		Find.find(@path) do |path|
		  if FileTest.directory?(path)
		    if File.basename(path)[0] == ?. and File.basename(path) != '.'
		      Find.prune
		    else
		      arr << make_file_obj(path, library_id) if path != @path # add directory
		    end
		  else
		    arr << make_file_obj(path, library_id) # add file
		  end
		end	
		return arr	
	end

	private

	def make_file_obj(path, library_id)
		obj = File.stat(path)
		{
		  id:Model.generate_id, library_id:library_id, 
	      created_at:obj.ctime, updated_at:obj.mtime,
	      file:File::file?(path), name:filename(path), path:filepath(path)
	    }
	end	

	def filename(path)
		File.basename(path)
	end

	def filepath(path)
		File.dirname(path.gsub(@path,""))
	end
end