require './lib/day_care'
require './lib/customer'
require './lib/pet'
require 'pry'

RSpec.describe DayCare do
  before(:each) do
    @day_care = DayCare.new("The Dog Spot")
    @joel = Customer.new("Joel", 2)
    @billy = Customer.new("Billy", 3)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
    @molly = Pet.new({name: "Molly", type: :cat})
  end
  

    it "exists" do
      expect(@day_care).to be_instance_of(DayCare)
    end

    it "has a name" do
      expect(@day_care.name).to eq("The Dog Spot")
    end

    it "starts with no customers" do
      expect(@day_care.customers).to eq([])
    end
 
    it 'adds customers'do
    @day_care.add_customer(@joel)
    @day_care.add_customer(@billy)

    expect(@day_care.customers).to eq([@joel, @billy])
    end

    it 'can find customer by the customers id' do
      @day_care.add_customer(@joel)
      @day_care.add_customer(@billy)

      expect(@day_care.customer_by_id(2)).to eq(@joel)
      expect(@day_care.customer_by_id(3)).to eq(@billy)

    end

    it 'can return the unfed pets' do
      @day_care.add_customer(@joel)
      @day_care.add_customer(@billy)

      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      @billy.adopt(@molly)

      @samson.feed

      expect(@day_care.unfed_pets).to eq([@lucy, @molly])
    end
  it 'feeds the undef pets' do
    @day_care.add_customer(@joel)
    @day_care.add_customer(@billy)

    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @billy.adopt(@molly)

    @samson.feed
    @lucy.feed
    @molly.feed
    expect(@day_care.feed)

  end
end





















# describe "Integrations with Pets and Customers" do

#   it "can add customers" do
#     @day_care.add_customer(@joel)
#     @day_care.add_customer(@billy)
#     expect(@day_care.customers).to eq([@joel, @billy])
#   end

#   it "can list unfed pets" do
#     @joel.adopt(@samson)
#     @joel.adopt(@lucy)
#     @billy.adopt(@molly)

#     @day_care.add_customer(@joel)
#     @day_care.add_customer(@billy)

#     @lucy.feed

#     expect(@day_care.unfed_pets).to eq([@samson, @molly])

#   end

#   it "can find customer by id" do
#     @joel.charge(10)

#     @day_care.add_customer(@joel)
#     @day_care.add_customer(@billy)

#     expect(@day_care.customer_by_id(2)).to eq(@joel)
#   end
# end