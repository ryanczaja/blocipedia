class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :name, :public
  belongs_to :user
  scope :visible_to, lambda {|user| user ? scoped : where(public: true)}

  #default_scope order('rank DESC')

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true
end