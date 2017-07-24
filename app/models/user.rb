class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

	def validate_username
	  if User.where(email: self.name).exists?
	    errors.add(:name, :invalid)
	  end
	end

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end

