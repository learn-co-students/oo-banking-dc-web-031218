require_relative "./bank_account.rb"
require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if !sender.valid? || (sender.balance - @amount) < 0
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif sender.valid? && self.status != "complete"
      sender.balance-=@amount
      receiver.balance+=@amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance+=@amount
      receiver.balance-=@amount
      self.status = "reversed"
    end
  end
end
