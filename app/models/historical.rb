class Historical
  # == Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  # == Relations
  

  # == Atributos
  field :did,       type: String
  field :fmw,       type: String
  field :tms,       type: String
  field :bvol,      type: String
  field :tem1,      type: String
  field :hum1,      type: String
  field :solr,      type: String
  field :stm1,      type: String
  field :smo1,      type: String
end
