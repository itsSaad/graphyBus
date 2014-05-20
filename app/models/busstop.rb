class Busstop < Neo4j::Rails::Model

	# Nodes
	property :bus_stop_name, :type => String
	property :bus_stop_lat_long, :type => String
	property :bus_stop_sec_name, :type => String

	validates :bus_stop_name, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, length: {minimum: 3, maximum: 35}
    validates :bus_stop_lat_long, presence: true, format: {with: /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/, message: "Not in format"}
    validates :bus_stop_sec_name, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, length: {minimum: 3, maximum: 35}, :allow_blank => true
    
    def self.search(search)
        if search
            Busstop.find(:all, :conditions => ["\'bus_stop_name\' LIKE ?", "%#{search}%"])
        else
            Busstop.find(:all)
        end
    end

    def validateLatLong(fieldName = {})
        fieldErrors = Hash.new
        int = 0
        puts fieldName.size
        fieldName.each do |key, value|
            int +=1
            puts "#{int} iteration"
            if(isNumeric?(value))

            else
                fieldErrors[key] = 'Use proper \'LatLong\' address.'
            end
        end
        return fieldErrors
    end

    def isNumeric?(num)

		if(num =~ /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/)
			return true
		else
			return false
		end
	end
end
