class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end


  def execute_transaction
    if (sender.valid?) && (receiver.valid?) && (sender.balance >= self.amount)
      if self.status == "pending"
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      executed_sender = self.sender
      executed_receiver = self.receiver
      executed_amount = self.amount

      executed_sender.balance += executed_amount
      executed_receiver.balance -= executed_amount
      self.status = "reversed"
    end
  end

end
