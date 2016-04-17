class TripUser < ActiveRecord::Base
  ## Relations
  belongs_to :trip
  belongs_to :user
end
