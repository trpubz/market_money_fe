class Market
  attr_reader :id, :name, :city, :state, :vendors
  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @city = attrs[:city]
    @state = attrs[:state]
    @vendors = []
  end

  def add_vendors

  end
end
