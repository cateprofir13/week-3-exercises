require './lib/groomer'
require './lib/customer'
require './lib/day_care.rb'
require './lib/pet'
require 'pry'

RSpec.describe Groomer do
  before(:each) do
    @groomer = Groomer.new("The Hair Ball")
    @joel = Customer.new("Joel", 2)
    @billy = Customer.new("Billy", 3)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
    @molly = Pet.new({name: "Molly", type: :cat})
  end

  describe "Object" do
    it "exists" do
      expect(@groomer).to be_instance_of(Groomer)
    end

    it "has a name" do
      expect(@groomer.name).to eq("The Hair Ball")
    end

    it "starts with no customers" do
      expect(@groomer.customers).to eq([])
    end
  end

    it "can add customers" do
      @groomer.add_customer(@joel)
      @groomer.add_customer(@billy)
      expect(@groomer.customers).to eq([@joel, @billy])
    end
    
    it 'find all the customers with outstanding balances' do
      @groomer.add_customer(@joel)
      @groomer.add_customer(@billy)

      @joel.charge(15)
      @billy.charge(7)

      expect(@groomer.ob_customer).to eq([@joel, @billy])
    end

    it 'can count pets by type' do
      @groomer.add_customer(@joel)
      @groomer.add_customer(@billy)

      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      @billy.adopt(@molly)
    
      expect(@groomer.pet_count(:cat)).to eq(2)
      expect(@groomer.pet_count(:dog)).to eq(1)
    end

    it 'returns services' do
      @groomer.add_customer(@joel)
      @groomer.add_customer(@billy)

      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      @billy.adopt(@molly)

      @groomer.add_service({name: "hairwash", cost: 10})
      @groomer.add_service({name: "haircut", cost: 15})

      expect(@groomer.services).to eq([{name: "hairwash", cost: 10}, {name: "haircut", cost: 15}])
    end

    it "charges the correct pet for a specific service" do

      @groomer.add_service({name: "hairwash", cost: 10})
      @groomer.add_service({name: "haircut", cost: 15})

      @groomer.charge_pet(@joel, @samson, "haircut")

      expect(@samson.charges).to eq([{name: "haircut", cost: 15}])
    end

    # it "does not charge the pet if service is not found" do @groomer.add_service({name: "hairwash", cost: 10})
    #   @groomer.add_service({name: "haircut", cost: 15})
    #   @groomer.charge_pet(@joel, @samson, "nail trimming")

    #   expect(@samson.charges).to eq([]) # No charge added
    # end

end














