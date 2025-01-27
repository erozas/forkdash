class Avo::Resources::Address < Avo::BaseResource
  self.includes = []
  self.title = :line_1
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :addressable, 
    as: :belongs_to, 
    polymorphic_as: :addressable, 
    searchable: true,
    types: [::User, ::Branch], 
    polymorphic_help: "Elige el tipo de modelo al que pertenece esta dirección"
    field :default, as: :boolean
    field :line_1, as: :text
    field :line_2, as: :text
    field :apt_number, as: :text
    field :zip_code, as: :text
    field :city, as: :text
    field :country, as: :country
    field :coordinates, as: :location, stored_as: [:lat, :lng]
    field :google_place_id, as: :text
  end

  def actions
    action Avo::Actions::SetGooglePlaceId
    action Avo::Actions::MarkAddressAsDefault
  end
end
