class User < ActiveRecord::Base
  ## Devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :validatable
  
  ## Relations
  has_many :owned_trips, class_name: 'Trip', dependent: :destroy
  has_many :trip_users, dependent: :destroy
  has_many :joined_trips, through: :trip_users, source: :trip
  
  ## Callbacks
  before_create :mark_email_as_unconfirmed
  
  ## Validations
  validates :name, presence: true
  
protected
  
  # Make sure to mark email as unconfirmed after registration
  def mark_email_as_unconfirmed
      self.unconfirmed_email = self.email
    end  
end
