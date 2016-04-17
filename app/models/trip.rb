class Trip < ActiveRecord::Base
  ## Relations
  belongs_to :user
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  
  ## Validations
  validates :begins_at,
    :source_address, :source_latitude, :source_longitude,
    :destination_address, :destination_latitude, :destination_longitude, presence: true
  validate :begins_at_is_in_the_future
  
  ## Scopes
  scope :upcoming, -> { where('begins_at >= ?', Time.current) }
  
  ## Methods
  def begins_at_is_in_the_future
    self.errors.add :begins_at, 'should be in the future' \
      if self.begins_at && self.begins_at < Time.current
  end
end
