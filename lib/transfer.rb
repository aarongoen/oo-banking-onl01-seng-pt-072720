class Transfer

attr_accessor :status, :bank_account
attr_reader :sender, :receiver, :amount

def initialize(sender, receiver, amount, status="pending")
  @sender = sender
  @receiver = receiver
  @amount = amount 
  @status = status
end

def valid?
  sender.valid? && receiver.valid?
end 

def execute_transaction
  if valid? && sender.balance > amount && @status != "complete"
    sender.balance -= amount 
    receiver.balance += amount
    @status = "complete"
  else @status = "rejected"
  "Transaction rejected. Please check your account balance."
  end 
end 

def reverse_transfer
  if @status == "complete"
    receiver.balance -= amount 
    sender.balance += amount
  @status = "reversed"
  end
end 

end
