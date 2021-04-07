class Weather
  # == Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  # == Relations

  # == Atributos
  field :pressure,        type: String
  field :temperature,     type: String
  field :humidity,        type: String
  field :sunset,          type: String
  field :sunrise,         type: String
  field :wind_speed,      type: String
  field :wind_deg,        type: String
  field :event_id,        type: String
  field :tms,             type: String
end
