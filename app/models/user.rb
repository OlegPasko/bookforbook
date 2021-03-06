class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid, :iwant
  has_many :books
  has_many :messages
  
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.name = auth["info"]["email"].split('@')[0]
    end
  end
end
