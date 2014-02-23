class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :name, :public
  belongs_to :user
  belongs_to :collaborators
  scope :visible_to, lambda {|user| user ? scoped : where(public: true)}

  has_many :collaborators

  has_many :collaborations, through: :collaborators, source: :user

  default_scope order('created_at DESC')

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true
end