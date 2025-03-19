class Pet
  attr_reader :name,
              :type
  attr_accessor :charges
  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @fed = false
    @charges = []
  end

  def feed
    @fed = true
  end

  def fed?
    @fed
  end

  # def add_charge(service)
  #   @charges << { amount: service[:cost], service_n: service[:name] }
  #   #binding.pry
  # end
end
