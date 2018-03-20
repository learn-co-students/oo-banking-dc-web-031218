class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 0
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  def self.all
    @@all
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && @status == "complete"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif sender.valid? == false || receiver.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif sender.valid? == true && sender.balance > amount && @status == "pending"
      receiver.balance = receiver.deposit(amount)
      sender.balance = sender.withdraw(amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.withdraw(amount)
      @status = "reversed"
    else
      @status = "rejected"
    end
  end
end
