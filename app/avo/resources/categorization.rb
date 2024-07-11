class Avo::Resources::Categorization < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :category, as: :belongs_to
    field :categorizable, as: :text
  end
end
