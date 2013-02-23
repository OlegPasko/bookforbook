class Book < ActiveRecord::Base
  attr_accessible :author, :comment, :title, :user_id, :cover
  
  belongs_to :user
  has_many :messages, :dependent => :destroy
  
  scope :keywords, lambda { |keywords| where("title LIKE ? OR author LIKE ?", "%#{keywords.downcase}%", "%#{keywords.downcase}%") }
end
