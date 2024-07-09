class Avo::Resources::User < Avo::BaseResource
  self.includes = []
  self.title = :username
  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      query.friendly.find(id)
    end
  }

  self.search = {
    query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  }

  def fields
    field :avatar, as: :file, is_image: true, link_to_record: true
    field :id, as: :id
    field :email, as: :text
    field :sign_in_count, as: :number
    field :username, as: :text
    field :slug, as: :text
    field :phone_number, as: :text
    field :phone_number_verified, as: :boolean
    field :admin, as: :boolean
    field :addresses, as: :has_many, inverse_of: :addressable
  end
end
