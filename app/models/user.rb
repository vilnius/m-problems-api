class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 viisp]

  has_many :reports

  belongs_to :city, optional: true

  scope :guests, -> { where(guest: true) }

  def email_required?
    !guest? && !personal_code?
  end

  def self.find_for_authentication(tainted_conditions)
    find_first_by_auth_conditions(tainted_conditions, blacklisted: false)
  end

  def active_for_authentication?
    super && !blacklisted?
  end
end
