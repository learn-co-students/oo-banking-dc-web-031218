class BankAccount
	attr_accessor :status
	attr_reader :name, :balance
	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(sum)
		self.balance += sum
		
	end

	def balance=(sum)
		@balance = sum
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		self.status == "open" && self.balance > 0
	end

	def close_account
		self.status = "closed"
	end

end	
