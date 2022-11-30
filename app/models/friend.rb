class Friend < ApplicationRecord
  belongs_to :user
  has_many :user_friends, dependent: :destroy
end
