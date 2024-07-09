class Avo::Actions::MarkAddressAsDefault < Avo::BaseAction
  self.name = "Mark address as default"
  self.visible = true

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |record|
      user = record.addressable
      user.addresses.update_all(default: false)
      record.update(default: true)
    end

    succeed "Addresses were marked as default."
    reload
  end
end
