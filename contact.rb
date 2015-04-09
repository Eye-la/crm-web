class Contact # kind of acting like a model

	attr_accessor :id, :first_name, :last_name, :email, :notes

	def initialize(first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end

  def to_s
    puts "ID: #{id}"
    puts "First name: #{first_name}"
    puts "Last name: #{last_name}"
    puts "Email: #{email}"
    puts "Notes: #{notes}"  
  end


	#check for blank value
  # def inspect 	
	# end

end
