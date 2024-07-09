class Addresses::SetGooglePlaceIdWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 10

  def perform(address_id)
    address = Address.find(address_id)
    Addresses::SetGooglePlaceId.call(address: address)
  end
end