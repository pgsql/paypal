class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable, :registerable, :recoverable, :rememberable
  belongs_to :role
  devise :database_authenticatable, :trackable, :validatable,:registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :access_until, :login
  
  validates_presence_of   :login
  validates_uniqueness_of :login
  
  def admin?
    !self.role.nil?
  end
end
