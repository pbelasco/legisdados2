class Orgao
  include Mongoid::Document
  field :id, type: String
  field :sigla, type: String
  field :descricao, type: String
  has_many :memberships


  validates_presence_of :sigla, :message => "Tem que ter uma sigla"

end
