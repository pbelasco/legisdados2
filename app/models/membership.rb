class Membership
  include Mongoid::Document
  field :tipo, type: String
  belongs_to :orgao, inverse_of: :orgao
  belongs_to :parlamentar, inverse_of: :parlamentar
end
