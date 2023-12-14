class Market
  attr_reader :id, :name, :city, :state, :vendors
  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @address = attrs[:street]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @vendors = []
    @fetched_vendors = false
  end

  def address
    "#{@address}\n#{@city}, #{@state} #{@zip}"
  end

  def fetched_vendors?
    @fetched_vendors
  end

  def add_vendors(data)
    @vendors = data.map { |vendor| Vendor.new(vendor) }
    @fetched_vendors = true
  end
end
