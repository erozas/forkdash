class Avo::Resources::PhoneNumber < Avo::BaseResource
  self.includes = []
  self.title = :full_number

  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :area_code, as: :text
    field :number, as: :text
    field :default, as: :boolean
    field :verified, as: :boolean
    field :banned, as: :boolean
    field :phoneable, 
      as: :belongs_to, 
      polymorphic_as: :phoneable, 
      searchable: true, 
      types: [::User], 
      polymorphic_help: "El tipo de modelo al que pertenece este número de teléfono"
  end
end
