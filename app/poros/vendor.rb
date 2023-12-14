class Vendor
  attr_reader :id, :name, :contact, :phone, :credit_accepted, :description

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @contact = attrs[:contact_name]
    @phone = attrs[:contact_phone]
    @credit_accepted = attrs[:credit_accepted]
    @description = attrs[:description]
  end
end
