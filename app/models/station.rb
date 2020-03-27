class Station < ApplicationRecord
  belongs_to :house

  STATION_FORMAT = 2
end
