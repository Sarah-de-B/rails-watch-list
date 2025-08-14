class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
  # validates_associated :bookmarks, presence: true
end
