class Groomer
  attr_reader :name,
              :customers,
              :services

  def initialize(name)
    @name = name
    @customers = []
    @services = []
  end

  def add_customer(customer)
    @customers << customer
  end
 
  def ob_customer 
    @customers.find_all do |customer|
       customer.outstanding_balance > 0 
      end
  end

  def helper_m
    petsonly = []
    @customers.each do |customer|
      petsonly += customer.pets
    end
    petsonly
    #binding.pry
  end

  def pet_count(type)
    count = 0
    helper_m.each do |pet|
      if pet.type == type
       count += 1
       
      end
      #binding.pry
    end
    count
  end

  def add_service(service)
    @services << service
  end
  
  #This method's goal is to apply a service to a pet
   #by adding a charge for the service

  def charge_pet(customer, pet, service_name)
    service = @services.find { |s| s[:name] == service_name } 
    puts "Service found: #{service.inspect}"
    return unless service  # Exit early if service not found
  
    pet.add_charge(service) # Pet logs the service charge
    binding.pry
  end
  


end