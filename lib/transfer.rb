require_relative 'bank_account.rb'
class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
  	@sender, @receiver, @amount = sender, receiver, amount
  	@status = "pending"
  end

  def valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if self.valid? && self.status == "pending" && sender.balance > amount
  		sender.balance -= amount
  		receiver.balance += amount
  		self.status = "complete"
  	else
  		self.status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	if self.status == "complete"
  		sender.balance += amount
  		receiver.balance -= amount
  		self.status = "reversed"
  	else
  		"Can only reverse completed transactions"
  	end
  end
end
