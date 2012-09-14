class Model

	attr_accessor :id, :name, :created_at	

	def initialize(params = {})
    	params.each do |attr, value|
      		self.public_send("#{attr}=", value) if self.respond_to? "#{attr}="
    	end if params
	end

	def save_to_file(path, data = {})
		File.open(path,"w+") do |f|
		  f.write(data.to_json)
		end
		true
	end

	def to_hash
		hash = {}
		return hash unless @to_hash_params
	    @to_hash_params.each {|var| hash[var] = instance_variable_get("@#{var.to_s}") }
		hash
	end

    def search(filter)
    	raise "Not availalable for parent class"
    end	

	#==========		

	def self.generate_id
		SecureRandom.hex 
    end	

end