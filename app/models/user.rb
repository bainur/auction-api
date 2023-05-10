class User < ApplicationRecord
  has_many :autobids
  has_many :auctions

  AUTH = {'user1': 'f9833734-4368-452e-8a0c-92b5acd43387',
    'user2': '0f17bb05-d05b-40b6-9445-b57c16ae06e6'}
  def authentication(password)
    return true if username == 'user1' && password == '12345678'

    return true if username == 'user2' && password == '12345678'

    false
  end

end
