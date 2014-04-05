class Post < ActiveRecord::Base
  has_many :comments, dpendent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end