require 'rubygems'
require 'mechanize'

class Client
  def self.has_tickets?(plate_number, plate_state)
    response = Mechanize.new.post("https://wmq.etimspayments.com/pbw/inputAction.doh", :plateNumber => plate_number, :statePlate => plate_state, :clientcode => "19", :requestType => "submit", :surcharge => "2.50", :requestCount => "1", :clientAccount => "5")
    not response.body.include?("The Plate entered has a balance of $0.00")
  end
end