class Message < ActiveRecord::Base
  attr_accessible :body, :book_id, :recepient_id, :user_id
end