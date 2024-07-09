class Avo::Actions::SetGooglePlaceId < Avo::BaseAction
  self.name = "Set Google Place Id"
  self.visible = true

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |record|
      Addresses::SetGooglePlaceIdWorker.perform_async(record.id)
    end

    succeed "Google Place Ids are being set."
    reload
  end
end
