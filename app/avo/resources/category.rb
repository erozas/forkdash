class Avo::Resources::Category < Avo::BaseResource
  self.includes = []
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
    field :parent_id, 
      as: :select,
      include_blank: "None (Root category)",
      options: -> do
        record.eligible_categories
      end
    field :name, as: :text
    field :description, as: :trix
    field :image, as: :file, direct_upload: true
    field :hex_bg_color, as: :text
    field :hex_fg_color, as: :text
  end
end
