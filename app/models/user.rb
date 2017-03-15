class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_one :profile
  before_create :build_profile #creates profile at user registration
  acts_as_followable
  acts_as_follower
  acts_as_liker
  acts_as_mentionable
  acts_as_mentioner
  # Only allow letter, number, underscore and punctuation.
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # setting login as email or username from Divise
  def login=(login)
  @login = login
  end

  def login
  @login || self.username || self.email
  end

#overwriting authentication method to use both email and username
def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
