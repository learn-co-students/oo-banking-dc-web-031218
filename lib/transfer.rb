class Transfer
$transfer_id
attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver,amount)
    @transfer_id = "Dolly The TransferSheep"
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  if self.status == "pending" && self.valid? == true && self.sender.balance > self.amount
    self.receiver.deposit(self.amount)
    self.sender.withdraw(self.amount)
     @status = "complete"
  else
    @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
  if self.status == "complete"
  self.sender.deposit(self.amount)
  self.receiver.withdraw(self.amount)
  @status = "reversed"
end
end


end
