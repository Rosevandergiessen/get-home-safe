class Helpline < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
end
