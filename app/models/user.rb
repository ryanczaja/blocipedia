class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :roles
  has_many :wikis
  has_many :collaborators

  has_many :collaborations, through: :collaborators, source: :wiki

  before_create :set_member

  # attr_accessible :title, :body

  ROLES = %w[member collaborator premium_member moderator admin]
  def role?(base_role)
  	role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def upgradeToPremium
    self.role = 'premium_member'
    self.update_attribute(:role, 'premium_member')
  end

  private

  def set_member
  	self.role = 'member'
  end

end
