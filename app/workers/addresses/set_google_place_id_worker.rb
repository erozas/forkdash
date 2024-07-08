class Addresses::SetGooglePlaceIdWorker
  include Sidekiq::Worker

  def perform(address_id)
    address = Address.find(address_id)
    Addresses::SetGooglePlaceId.call(address: address)
  end
end