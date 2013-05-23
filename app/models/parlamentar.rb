class Parlamentar
  include Mongoid::Document
  field :idCcadastro, type: Integer
  field :matricula, type: Integer
  field :idParlamentar
  field :nome, type: String
  field :nomeParlamentar, type:String
  field :partido, type: String
  field :legislatura, type: String
  field :sexo, type: String
  field :uf, type: String
  field :gabinete, type: String
  field :anexo, type: String
  field :fone, type: String
  field :email, type: String
  has_many :memberships, :dependent => :destroy


end
