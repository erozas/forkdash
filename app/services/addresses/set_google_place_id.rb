module Addresses
  class SetGooglePlaceId
    attr_reader :address

    def initialize(params)
      @address = params[:address]
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      address.update(google_place_id: google_place_id)
    end

    private

    def google_place_id
      GoogleGeocode.new(address).place_id
    end
  end
end