class Avo::Actions::SetGooglePlaceId < Avo::BaseAction
  self.name = "Set Google Place Id"
  self.visible = true

  # def fields
  #   # Add Action fields here
  # end

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |record|
      # Do something with your records.
    end
  end
end
