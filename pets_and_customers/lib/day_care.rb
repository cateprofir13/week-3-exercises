class DayCare
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customer_by_id(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def helper  
    justpets = []
    @customers.each do|customer|
      justpets += customer.pets
    #binding.pry
    end 
    justpets
    
    #binding.pry
  end

  def unfed_pets
    unfed = []
    helper.each do |pet|
      if pet.fed? == false
       unfed << pet
    #binding.pry
      end
    end
    unfed
  end

  def feed_all_unfed_pets
    unfed.each do |pet|
      if pet.fed? == true
        
      end
    end
  end
end





















# def add_customer(customer)
#   @customers << customer
# end

# def customer_by_id(id)
#   @customers.find do |customer|
#     customer.id == id
#   end
# end

# def unfed_pets
#   pets = @customers.map do |customer|
#     customer.pets
#   end.flatten
#   pets.find_all do |pet|
#     !pet.fed?
#   end
# end