class Api::MarketService
  def self.markets
    response = conn.get("markets?per_page=99999")

    response_conversion(response)
  end

  def self.conn
    Faraday.new("http://localhost:3000/api/v0")
  end

  def self.response_conversion(response)
    {status: response.status, data: JSON.parse(response.body, symbolize_names: true)[:data]}
  end
end
