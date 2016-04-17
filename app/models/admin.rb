class Admin < ActiveRecord::Base
  ## Devise
  devise :database_authenticatable, :rememberable, :validatable
end
