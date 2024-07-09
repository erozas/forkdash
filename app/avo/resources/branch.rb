class Avo::Resources::Branch < Avo::BaseResource
  self.includes = []
  self.extra_params = [seo_metadata_attributes: [:id, :title, :description]]
  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      query.friendly.find(id)
    end
  }
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :description, as: :trix
    field :headquarters, as: :boolean
    field :meta_title, as: :text
    field :meta_description, as: :textarea
    field :slug, as: :text
  end
end
