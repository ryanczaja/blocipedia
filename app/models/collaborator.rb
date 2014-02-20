class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
  attr_accessible :user_id, :wiki_id
end
