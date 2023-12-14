class Vendor
  attr_reader :id, :name, :contact, :phone, :credit_accepted, :description

  def initialize(data)
    @id = data[:id]

    attrs = data[:attributes]
    @name = attrs[:name]
    @contact = attrs[:contact_name]
    @phone = attrs[:contact_phone]
    @credit_accepted = attrs[:credit_accepted]
    @description = attrs[:description]
  end

  def credit_accepted?
    if @credit_accepted
      "YES"
    else
      "NO"
    end
  end
end
