class GoogleGeocode
  attr_reader :address, :response

  def initialize(address)
    @address = address
    @response = HTTParty.get(url)
  end

  def global_code
    response["plus_code"]["global_code"]
  end

  def place_id
    response["results"][0]["place_id"]
  end

  def formatted_address
    response["results"][0]["formatted_address"]
  end

  private

  def url
    "#{base_url}?latlng=#{lat_lng}&key=#{api_key}"
  end

  def lat_lng
    "#{address.lat},#{address.lng}"
  end

  def api_key
    ENV["GOOGLE_API_SERVER_KEY"]
  end

  def base_url
    "https://maps.googleapis.com/maps/api/geocode/json"
  end
end