require './lib/pet'

RSpec.describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
    @molly = Pet.new({name: "Molly", type: :cat})
  end

  it "exists" do
    expect(@samson).to be_instance_of(Pet)
  end

  it "has attributes" do
    expect(@samson.name).to eq("Samson")
    expect(@samson.type).to eq(:dog)
  end

  it "is not fed by default" do
    expect(@samson.fed?).to be(false)
  end

  it "can be fed" do
    @samson.feed
    expect(@samson.fed?).to be(true)
  end

  # it "can add service" do
   
  #   service1 = { name: "hairwash", cost: 10 }
  #   service2 = { name: "haircut", cost: 15 }
  #   @samson.add_charge(service1)
  #   @samson.add_charge(service2)
  # end

end
