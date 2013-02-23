class Book < ActiveRecord::Base
  attr_accessible :author, :comment, :title, :user_id
end
