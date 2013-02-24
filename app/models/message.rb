class Message < ActiveRecord::Base
  attr_accessible :body, :book_id, :recepient_id, :user_id
  
  belongs_to :user
  belongs_to :book
  
  validates_presence_of :body, :user_id, :book_id, :recepient_id
end
