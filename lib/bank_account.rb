
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(x)
    @balance= @balance + x

  end

  def display_balance
    if @balance==@balance.round(2)
      "Your balance is $#{@balance}."
    else
      "Your balance is $#{sprintf( "%0.02f", @balance)}."
    end
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
